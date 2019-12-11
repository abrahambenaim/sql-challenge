#!/usr/bin/env python
# coding: utf-8

# In[2]:


#Import dependencies
from sqlalchemy import create_engine
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from random import randint


# In[3]:


#Create engine and connection to DB
engine = create_engine('postgresql://postgres:Ab2423034@localhost:5433/employee_sql_HW')
connection = engine.connect()


# In[4]:


data_salaries = pd.read_sql("SELECT * FROM salary", connection)
data_titles = pd.read_sql("SELECT * FROM titles", connection)


# In[5]:


data_salaries


# In[6]:


data_titles


# In[7]:


#Join DF
final_df = pd.merge(data_salaries,data_titles, on='emp_no',suffixes=('_salaries','_titles'))
final_df.head()


# In[15]:


#Create histogram
salary_list=final_df.salary.to_list()
plt.hist(salary_list,rwidth=1,bins=10,edgecolor='white')
plt.xlabel('Employee Salary')
plt.ylabel('Employee count')
plt.tight_layout()
plt.savefig('histogram.png')


# In[36]:


groupby_df = final_df.groupby('title').mean()
del groupby_df['emp_no']
groupby_df = groupby_df.round({'salary': 2})
groupby_df=groupby_df.reset_index()
groupby_df


# In[43]:


plt.bar(groupby_df.title,groupby_df.salary,align="center",edgecolor='white')
ticks = np.arange(len(groupby_df.title))
plt.xticks(ticks,rotation=75)
plt.xlabel('Employee Title')
plt.ylabel('Avg Salary')
plt.title('Avg Salary per Employee Title')


# In[ ]:




