import sqlalchemy
import psycopg2
import pandas as pd 


# All Functions that will repeatably be used in the Golf Scores Project.

# to load data into postgres database
# need DataFrame, the Schema and the table 
# EX/ df, 'Courses', 'course_name' 
def load_sql(df,schema,table):
    engine = sqlalchemy.create_engine('postgresql://cbjohnson:Cooking30@localhost:5433/Golf_Scores?           gssencmode=disable')
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
    con = psycopg2.connect(database='Golf_Scores', user='cbjohnson', password='Cooking30', host='localhost', port='5433',gssencmode='disable')
    df = pd.read_sql_query(sql_query,con)
    con.close()
    return df




def load_procedure(schema, procedure, values): 

    conn = None
    try:
        # connect to the PostgreSQL database
        conn = psycopg2.connect(database='Golf_Scores', user='cbjohnson', password='Cooking30', host='localhost', port='5433',gssencmode='disable')
        cur = conn.cursor()
        # Call the procedure
        cur.execute('CALL {0}{1}'.format(schema+'.'+procedure, values))
        conn.commit()

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()