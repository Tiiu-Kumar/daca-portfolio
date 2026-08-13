
import logging
import time
import argparse

from data_fetcher import fetch_sales, fetch_customers, fetch_products
from transform import (
    clean_data,
    calculate_weekly_aggregates,
    calculate_kpis,
    merge_datasets
)
from visualize_export import (
    create_weekly_chart,
    create_kpi_summary,
    export_results
)


# Logimise seadistamine
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)


parser = argparse.ArgumentParser()
parser.add_argument('--date', type=str, default=None)
args = parser.parse_args()
start_time=time.time()
#result=run_pipeline(args.date)



def run_pipeline(report_date=None):
    """Käivitab kogu andmetöötluse pipeline'i.

    Pipeline:
    1. Andmete laadimine Supabase'ist
    2. Andmete puhastamine
    3. Nädalaste koondnäitajate arvutamine
    4. KPI-de arvutamine
    5. Andmestike ühendamine
    6. Diagrammide loomine
    7. Tulemuste eksport
    """

    logger.info("Pipeline started")
    print("Andmed kuni kuupäevani :", report_date)
    try:
        # --------------------------------------------------
        # 1. EXTRACT - andmete laadimine
        # --------------------------------------------------
        logger.info("Extract: laadime andmed Supabase'ist")
        if report_date is None:
            report_date = '2030-12-31'
        df_sales = fetch_sales(
            '2000-01-01',
            report_date
        )
        # print("df_sales viimane kuupäev:", df_sales['sale_date'].max())

        df_customers = fetch_customers()
        df_products = fetch_products()

        logger.info(
            f"Extract complete: sales={len(df_sales)}, "
            f"customers={len(df_customers)}, "
            f"products={len(df_products)}"
        )

        # --------------------------------------------------
        # 2. TRANSFORM - andmete puhastamine
        # --------------------------------------------------
        logger.info("Transform: puhastame müügiandmed")

        df_clean = clean_data(df_sales)

        logger.info(
            f"Clean complete: {len(df_clean)} rida"
        )

        # --------------------------------------------------
        # 3. WEEKLY AGGREGATES
        # --------------------------------------------------
        logger.info("Transform: arvutame nädalased koondnäitajad")

        df_weekly = calculate_weekly_aggregates(df_clean)

        logger.info(
            f"Weekly aggregates complete: "
            f"{len(df_weekly)} nädalat"
        )

        # --------------------------------------------------
        # 4. KPI-d
        # --------------------------------------------------
        logger.info("Transform: arvutame KPI-d")

        kpis = calculate_kpis(df_clean)

        logger.info(
            f"KPI complete: {kpis}"
        )

        # --------------------------------------------------
        # 5. MERGE
        # --------------------------------------------------
        logger.info("Transform: ühendame müügi- ja kliendiandmed")

        df_merged = merge_datasets(
            df_clean,
            df_customers
        )

        logger.info(
            f"Merge complete: {len(df_merged)} rida"
        )

        # --------------------------------------------------
        # 6. VISUALIZE
        # --------------------------------------------------
        logger.info("Visualize: loome nädalase müügitulu diagrammi")

        weekly_chart = create_weekly_chart(df_weekly)

        logger.info("Weekly chart created")

        logger.info("Visualize: loome KPI kokkuvõtte")

        kpi_chart = create_kpi_summary(kpis)

        logger.info("KPI summary created")

        # --------------------------------------------------
        # 7. EXPORT
        # --------------------------------------------------
        logger.info("Export: salvestame tulemused")

        export_results(
            df_weekly,
            output_dir='output'
        )

        weekly_chart.write_html(
            'output/weekly_revenue.html'
        )

        kpi_chart.write_html(
            'output/kpi_summary.html'
        )

        logger.info("Export complete")

        # --------------------------------------------------
        # PIPELINE VALMIS
        # --------------------------------------------------
        logger.info(
            f"Pipeline complete: {len(df_clean)} rows processed"
        )

        return {
            'sales_rows': len(df_sales),
            'clean_rows': len(df_clean),
            'weekly_rows': len(df_weekly),
            'kpis': kpis
        }

    except Exception as e:
        logger.error(
            f"Pipeline failed: {e}",
            exc_info=True
        )
        raise


if __name__ == "__main__":

    start_time = time.time()

    try:
        result = run_pipeline(args.date)

        elapsed = time.time() - start_time

        print("\nPipeline edukalt lõpetatud!")
        print(f"Töödeldud müügi ridu: {result['sales_rows']}")
        print(f"Puhastatud ridu: {result['clean_rows']}")
        print(f"Nädalaid: {result['weekly_rows']}")
        print(f"KPI-d: {result['kpis']}")
        print(f"Koguaeg: {elapsed:.2f} sekundit")

    except Exception as e:
        elapsed = time.time() - start_time

        print("\nPipeline ebaõnnestus!")
        print(f"Viga: {e}")
        print(f"Katkestuseni kulunud aeg: {elapsed:.2f} sekundit")

