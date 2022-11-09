# Sales-Performance-Report-with-MySQL
### Overall Performance by Year
Membuat Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years). 
Output:
    ![output1](https://github.com/ajiepamungkasep/Sales-Performance-Report-with-MySQL/blob/main/1.JPG)
     
    SELECT
	    LEFT(order_date,4) as years,
        SUM(sales) as sales,
        COUNT(order_status) as number_of_order
    FROM dqlab.dqlab_sales_store
    WHERE order_status = 'Order Finished'
    GROUP BY 1
    ORDER BY 1;