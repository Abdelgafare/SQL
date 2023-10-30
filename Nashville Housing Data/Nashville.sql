--- 
select *
from Nashville

-- standardize date format we first will add column that has the format we needed to apply on the all dates then we insert the data of the data in the new column and will remove it 
select saledate ,cast(saledate as date)
from Nashville
order by saledate

alter table Nashville 
add saledateconv date
update Nashville 
set SaleDateconv = convert (date,saledate)

select saledateconv ,cast(saledate as date)
from Nashville
order by saledate


--- since i found that we have some people have the same parcel id and address but different unique id(different person not duplicate )we gone fill the property adrres using pracel id
select PropertyAddress
from Nashville
where PropertyAddress is null

select a.ParcelID,a.PropertyAddress ,b.ParcelID,b.PropertyAddress,isnull(a.PropertyAddress,b.PropertyAddress)
from Nashville a
join Nashville b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress =isnull(a.PropertyAddress,b.PropertyAddress)
from Nashville a
join Nashville b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

select PropertyAddress
from Nashville
where PropertyAddress is null

-- breaking address into individual columns (address,city)
select PropertyAddress
from Nashville
select
substring (PropertyAddress, 0,CHARINDEX(',',PropertyAddress) )as address,
substring (PropertyAddress,CHARINDEX(',',PropertyAddress) +1,len(PropertyAddress))as city
from Nashville

--or this can work also
select
substring (PropertyAddress, 1,CHARINDEX(',',PropertyAddress)-1)as address,
substring (PropertyAddress,CHARINDEX(',',PropertyAddress) +1,len(PropertyAddress))as city
from Nashville



alter table Nashville 
add address nvarchar(255)
update Nashville 
set address = substring (PropertyAddress, 1,CHARINDEX(',',PropertyAddress)-1)
alter table Nashville 
add city nvarchar(255)
update Nashville 
set city = substring (PropertyAddress,CHARINDEX(',',PropertyAddress) +1,len(PropertyAddress))

select city , address
from Nashville
select PropertyAddress
from Nashville


-- for the owner address also and (address ,city ,state) we will use PARSENAME
select PARSENAME(replace(owneraddress,',',	'.'),1) as owstate,
PARSENAME(replace(owneraddress,',',	'.'),2) as owcity,
PARSENAME(replace(owneraddress,',',	'.'),3)as owaddress
from Nashville
alter table Nashville 
add owstate nvarchar(255)
update Nashville 
set owstate = PARSENAME(replace(owneraddress,',',	'.'),1)
alter table Nashville 
add owcity nvarchar(255)
update Nashville 
set owcity = PARSENAME(replace(owneraddress,',',	'.'),2)
alter table Nashville 
add owaddress nvarchar(255)
update Nashville 
set owaddress = PARSENAME(replace(owneraddress,',',	'.'),3)

select *
from Nashville
order by 3

---- i see that we have in sold as vacant (yes ,no,y,n) so we will try to change it
select  distinct(SoldAsVacant), count(SoldAsVacant)
from Nashville
group by SoldAsVacant  ----since ihave the piority are saved as yes and no so we will try to unit


select SoldAsVacant,
case when SoldAsVacant ='Y' then 'Yes' 
when SoldAsVacant ='n' then 'No'
else SoldAsVacant 
end as soldasvacanteee
from Nashville
update Nashville
set SoldAsVacant= case when SoldAsVacant ='Y' then 'Yes' 
when SoldAsVacant ='n' then 'No'
else SoldAsVacant 
end

----- remove duplicates we will use cte to try not damage the data  

with rownumcte as(
select * ,
ROW_NUMBER() over(partition by parcelid, propertyaddress,saleprice,saledate,legalreference order by uniqueid) more_thanone_is_dup
from Nashville)
select* 
from rownumcte
where more_thanone_is_dup>1



with rownumcte as(
select * ,
ROW_NUMBER() over(partition by parcelid, propertyaddress,saleprice,saledate,legalreference order by uniqueid) more_thanone_is_dup
from Nashville)
delete
from rownumcte
where more_thanone_is_dup > 1

---- delete unused columns 
alter table Nashville
drop column  owneraddress,taxdistrict,propertyaddress,saledate
select *
from Nashville