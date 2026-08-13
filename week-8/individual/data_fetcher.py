#
#Roll A API Query

from supabase import create_client
from dotenv import load_dotenv
import os, pandas as pd
import logging

logger = logging.getLogger(__name__)

# Lae .env failist Supabase'i ühenduse andmed
load_dotenv()
supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_KEY"))

def fetch_sales(start_date=None, end_date=None): 
    """Pärib Supabase'ist müügiandmed etteantud kuupäevavahemikus.   
    Args: 
        start_date: Müügiperioodi alguskuupäev. 
        end_date: Müügiperioodi lõppkuupäev. 
    Returns:
        DataFrame: Müügiandmed.
    
    """
    try:
        data = [] 
        page_size = 1000 
        page = 0     

        while True: 
            # loome supabase päringu  
            query = supabase.table('sales').select('*')
            # kuupäevafiltrid
            if start_date:
                query = query.gte('sale_date', start_date)

            if end_date:
                query = query.lt('sale_date', end_date)

            response = query.range( page * page_size, (page + 1) * page_size - 1 ) .execute() 
            
            data.extend(response.data)
            if len(response.data) < page_size:
                break
            page += 1
        df= pd.DataFrame(data)
        logger.info(f"Laaditud {len(df)} müüki")

        return df

    except Exception as e:
        logger.error(f"Viga müügiandmete laadimisel: {e}")
        return pd.read_csv("sales_rows.csv") #tagastab CSV faili kui Supabase andmebaasiga ühendus ei õnnestu
        #return pd.DataFrame()

def fetch_customers(): 
    """Pärib Supabase'ist kõik kliendiandmed.   
    Returns: 
        DataFrame: Kliendiandmed.
    """
    try:
        data = [] 
        page_size = 1000 
        page = 0     
        
        while True: 
            response = ( 
                supabase.table('customers') 
                .select('*') 
                .range( 
                    page * page_size, 
                    (page + 1) * page_size - 1
                ) 
                .execute() 
            ) 
            data.extend(response.data)
            if len(response.data) < page_size:
                break
            page += 1
        return pd.DataFrame(data)

    except Exception as e:
        print(f"Viga kliendiandmete laadimisel: {e}")
        return pd.read_csv("customers_rows.csv") #tagastab CSV faili kui Supabase andmebaasiga ühendus ei õnnestu
        #return pd.DataFrame()
    
def fetch_products():
    """Pärib Supabase'ist kõik tooteandmed.
    Returns:
        DataFrame: Tooteandmed.
    """
    try:
        data = [] 
        page_size = 1000 
        page = 0     
        
        while True: 
            response = ( 
                supabase.table('products') 
                .select('*') 
                .range( 
                    page * page_size, 
                    (page + 1) * page_size - 1
                ) 
                .execute() 
            ) 
            data.extend(response.data)
            if len(response.data) < page_size:
                break
            page += 1
        return pd.DataFrame(data)

    except Exception as e:
        print(f"Viga tooteandmete laadimisel: {e}")
        return pd.DataFrame()

# Testimine 


