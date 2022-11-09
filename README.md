# Sales-Performance-Report-with-MySQL
### Overall Performance by Year
Membuat query untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years). 

query:
     
    SELECT
	    LEFT(order_date,4) as years,
        SUM(sales) as sales,
        COUNT(order_status) as number_of_order
    FROM dqlab.dqlab_sales_store
    WHERE order_status = 'Order Finished'
    GROUP BY 1
    ORDER BY 1;

output:  
    ![output1](https://github.com/ajiepamungkasep/Sales-Performance-Report-with-MySQL/blob/main/1.JPG)
    
### Overall Performance by Product Sub Category
Membuat Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) berdasarkan sub category dari produk (product_sub_category) pada tahun 2011 dan 2012 saja (years) 

query:
     
    SELECT 
	    LEFT(order_date,4) as years,
	    product_sub_category,
	    SUM(sales) as sales
    FROM dqlab.dqlab_sales_store
    WHERE 
    	order_status = 'Order Finished'
	    AND LEFT(order_date,4) > 2010
    GROUP BY years, product_sub_category
    ORDER BY years, sales DESC;
Output: 
![output2](https://github.com/ajiepamungkasep/Sales-Performance-Report-with-MySQL/blob/main/2.JPG)
