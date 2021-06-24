import sqlalchemy
import psycopg2
import pandas as pd 


# All Functions that will repeatably be used in the Gold Scores Project.

# to load data into postgres database
# need DataFrame, the Schema and the table 
# EX/ df, 'Courses', 'course_name' 
def load_sql(df,schema,table):
    engine = sqlalchemy.create_engine('postgresql://Username:Password@localhost:5433/Golf_Scores?gssencmode=disable')
    con = engine.connect()
    
    try:
        df.to_sql(table, con, if_exists='append', schema=schema, index=False, method='multi')
        print("Data Loaded Successfully")
    except:
        print("Can not enter data")
        engine.dispose()
        raise

    engine.dispose()
    return "END"


# to pull data from postgres database
# need SQL query
# EX/ test_query = '''
#     Select * from "Courses"."course_name"
#     '''
def pull_from_sql(sql_query):
    con = psycopg2.connect(database='Golf_Scores', user='Username', password='Password',host='localhost', port='5433',gssencmode='disable')
    df = pd.read_sql_query(sql_query,con)
    con.close()
    return df

