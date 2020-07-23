####  Dates in R

#### Step 1: Convert Int to dates

test<- data.frame(name=c("a","b","c"), dob=c("12-03-2016","11-08-2001","01-01-2001"))
test

test$dob<- as.Date(test$dob, '%d-%m-%y' ) ## Not work coz y means year with 2 digit 
str(test)

test$dob<- as.Date(test$dob, '%d-%m-%Y' ) ## It will work correctly
str(test)

#-----------------------------------------------------------------------------

test1<- data.frame(name=c("a","b","c"), dob=c("12/03/2016","11/08/2001","01/01/2001"))

test1$dob<- as.Date(test1$dob, '%Y/%m%d')## Not working(coz order not matching)
str(test1)


test1$dob<- as.Date(test1$dob, '%d/%m/%Y')
str(test1)

--------------------------------------------------------------------------------
#Changing dmy to some other ymd or mdy   
  
test2<- data.frame(name=c("a","b","c"), dob=c("2012/03/16","2011/08/20","2001/01/20"))
test2

test2$dob<- as.Date(test2$dob, '%Y/%m/%d')
str(test2)

#===============================================================================

##uSING fORMAT WE CAN DISPLAY the way we want


test

#oNLY YEAR(4 digit so Y)
format(test$dob, format='%Y')

#weekday(short so a)
format(test$dob, format='%a')

#weekd(ay(Full so A)
format(test$dob, format='%A')


#weelday(Full) AND month
format(test$dob, format='%A-%m')

###########Formula

# %d-> Date

#%m->Month in Number

#y-> Year is Short(2 Digit)
#Y-> Year in full(4 digit)


#a-> weekday in Short
#A-> weekday in Full

#b-> month in char(Half) jan
#B-> month in cahr(Full) JANUARY



###################    sYSTEM DATE    ####################################
Sys.Date()



############### DATE DIFF

compli<- data.frame(Name=c("a","b","c"), DOJ=as.Date(c("12-12-2012","01-03-2016","31-11-2015")),
                    LDay=as.Date(c("2013-12-12","01-03-2016","1-1-2016")))
compli

compli$DOJ-compli$LDay
diff.Date(compli$DOJ, format="%d.%m.%Y")

d<- compli[order(compli$DOJ),]
d
  diff(d$DOJ, weekdays())
  
    class(compli$DOJ)
diff.Date(compli$DOJ,compli$LDay)
difftime(compli$DOJ,compli$LDay, units = "weeks")
