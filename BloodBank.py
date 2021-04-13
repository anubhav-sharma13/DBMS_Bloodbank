import subprocess as sp
import pymysql
import pymysql.cursors
from getpass import getpass


def UpdateBloodCost():
    bloodId = int(input("Enter Blood_bag_number whose cost is to be Updated: "))
    new_cost = int(input("Enter updated cost: "))
    query0 = "Select count(*) AS cnt from BLOOD where blood_bag_number = %d" %(bloodId)
    
    query_duty = "UPDATE BLOOD_COST SET cost =  %d where blood_bag_number = %d" % ( new_cost,bloodId)

    try:
        cur.execute(query0)
        con.commit()
        val = cur.fetchall()
        val = val[0]
        val = val['cnt']
        if(val == 0) :
            print("Input blood_bag_number does not exist. Please enter valid input")
            return
        cur.execute(query_duty)
        con.commit()
        print("Blood cost updated sucessfully")
    except Exception as e:
        con.rollback()
        print("Failed to update database")
        print(">>>>>>>>>>>>>", e)

    return

def deleteBlood():
    
    delete_id = int(input("Enter Blood bag number to be deleted: "))

    query0 = "Select count(*) AS cnt from BLOOD where blood_bag_number = %d" %(delete_id)

    query1 = "DELETE FROM BLOOD where blood_bag_number = %d" % (delete_id)

    try:
        cur.execute(query0)
        val = cur.fetchall()
        val = val[0]
        val = val['cnt']
        # print(val)
        if(val == 0 ):
            print("Input blood_bag_number does not exist.Please enter a valid blood_bag_number")
            return

        cur.execute(query1)
        con.commit()
        print("Deleted successfully")
       
    except Exception as e:
        con.rollback()
        print("Failed to delete data from database")
        print(">>>>>>>>>>>>>", e)
    return    


def addBlood():
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new blood details: ")
        row["blood_bag_number"] = int(input("blood_bag_number: "))
        row["blood_type"] = input("blood_type: ")
        row["blood_amount"] = int(input("blood_amount: "))
        row["haemoglobin_count"] = float(input("haemoglobin_count: "))
        query = "INSERT INTO BLOOD(blood_bag_number,blood_type,blood_amount,haemoglobin_count) VALUES('%d', '%s', '%d', '%0.1f')" %(row["blood_bag_number"],row["blood_type"], row["blood_amount"], row["haemoglobin_count"])
  
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def addDonorInfo():
    try:
        row = {}
        print("Enter new donor's details: ")
        name = (input("Name (Fname Lname): ")).split(' ')
        row["fname"] = name[0]
        row["lname"] = name[1]
        row["donor_id"] = int(input("Donor_id: "))
        row["blood_type"]=input("Blood_type: ")
        row["age"] = int(input("Age: "))
        row["sex"] = input("Sex: ")
        row["phone_no"] = input("phone_no: ")

        query = "INSERT INTO DONOR_INFO(donor_id,blood_type,phone_no,age,sex,fname,lname) VALUES('%d', '%s', '%s','%d','%s','%s','%s')" %(row["donor_id"], row["blood_type"], row["phone_no"], row["age"],row["sex"],row["fname"],row["lname"])
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def addRecipient():
    try:
        row = {}
        print("Enter new recipient's details: ")
        row["fname"] = input("Name: ")
        row["rec_id"] = int(input("Rec_id: "))
        row["blood_type"]=input("Blood_type: ")
        row["quantity_needed"] = int(input("Quantity_needed: "))
        row["date_of_request"] = input("Date of request (YYYY-MM-DD): ")
        row["dOB"] = input("Date of Birth (YYYY-MM-DD): ")
        row["age"] = int(input("Age: "))
        row["sex"] = input("Sex: ")
        query = "INSERT INTO RECIPIENT(rec_id,blood_type,quantity_needed,date_of_request,fname,dOB,sex,age) VALUES('%d', '%s', '%d','%s','%s','%s','%s','%d')" %(row["rec_id"], row["blood_type"], row["quantity_needed"], row["date_of_request"],row["fname"],row["dOB"],row["sex"],row["age"])
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return


def addDonor():
    try :
        row={}
        print("Enter new donation details: ")
        row["donor_id"] = int(input("Donor-id: "))
        row["date_of_donation"] = input("Date of donation (YYYY-MM-DD): ")
        query = "INSERT INTO DONORS(donor_id,date_of_donation) VALUES('%d', '%s')" %(row["donor_id"],row["date_of_donation"])
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return
        

def hireStaff():
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new staff member's details: ")
        row["fname"] = input("Name: ")
        row["emp_id"] = int(input("emp_id: "))
        row["address1"] = input("address: ")
        row["salary"] = int(input("salary: "))
        row["phone_no"] = input("phone_no: ")

        query = "INSERT INTO STAFF(emp_id,fname, address1,phone_no,salary) VALUES('%d', '%s', '%s', '%s','%d')" %(row["emp_id"],row["fname"], row["address1"], row["phone_no"], row["salary"])
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def TotalBlood():
    try :
        query = "select SUM(blood_amount) total FROM BLOOD"
        cur.execute(query)
        con.commit()
        row = cur.fetchall()
        print("The total blood available is :")
        print(row)
    except Exception as e:
        con.rollback()
        print("Failed to find total blood")
        print (">>>>>>>>>>>>>", e)
        
    return

def TotalBloodOfGiven():
    try :
        a = input("Enter the blood type: ")
    # query1 = "DELETE FROM BLOOD where blood_bag_number = %d" % (delete_id)

        query = "select SUM(blood_amount) FROM BLOOD where blood_type='%s'" % (a)
        cur.execute(query)
        con.commit()
        row = cur.fetchall()
        print("The total available blood of type '%s' is :",a)
        print(row)
    except Exception as e:
        con.rollback()
        print("Failed to find total blood of given type")
        print (">>>>>>>>>>>>>", e)
        
    return     

def ViewBlood():
    try :
        query = "select * FROM BLOOD"
        cur.execute(query)
        con.commit()
        row = cur.fetchall()
        print(row)
    except Exception as e:
        con.rollback()
        print("Failed to find total blood")
        print (">>>>>>>>>>>>>", e)

    return

def AddBloodCost():
    try :
        row={}
        print("Enter following details: ")
        row["blood_bag_number"] = int(input("Blood bag number: "))
        row["cost"] = int(input("Cost: "))
        query = "INSERT INTO BLOOD_COST(blood_bag_number,cost) VALUES('%d', '%d')" %(row["blood_bag_number"],row["cost"])
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e)
        
    return

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch==1): 
        addDonor()
    elif(ch==2):
        addDonorInfo()
    elif(ch==3):
        addBlood()
    elif(ch==4):
        addRecipient()
    elif(ch==5):
        hireStaff()
    elif(ch == 6):
        deleteBlood()
    elif(ch == 7):
        UpdateBloodCost()
    elif(ch ==8):
        TotalBlood()
    elif(ch==9):
        TotalBloodOfGiven()
    elif(ch ==10):
        ViewBlood()
    elif(ch == 11):
        AddBloodCost()    
    else:
        print("Error: Invalid Option")

# Global
while(1):
    tmp = sp.call('clear',shell=True)
    username = input("Username: ")
    password = getpass("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='BLOODBANK',
                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear',shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")

        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("1. Add new donation")
                print("2. Add new donor information")
                print("3. Add new blood")
                print("4. Add new recipient")
                print("5. Hire a new employee")
                print("6. Delete a blood sample")
                print("7. Change Blood Cost")
                print("8. Total Blood Donated")
                print("9. Total Blood of given type Donated")
                print("10. View Blood")
                print("11. Add Blood cost")
                print("12. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if ch==12:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")


    except:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
