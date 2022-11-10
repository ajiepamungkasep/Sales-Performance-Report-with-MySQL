SELECT *
FROM dqlab.dqlab_sales_store;

/* I. Overall Performance by Year
Membuat query untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years). */
SELECT
	LEFT(order_date,4) as years,
    SUM(sales) as sales,
    COUNT(order_status) as number_of_order
FROM dqlab.dqlab_sales_store
where order_status = 'Order Finished'
GROUP BY 1
ORDER BY 1;

/* II. Overall Performance by Product Sub Category
Membuat Query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) berdasarkan sub category dari produk (product_sub_category) pada tahun 2011 dan 2012 saja (years) */
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

/* III. Promotion Effectiveness and Efficiency by Years
Task : Membuat Derived Tables untuk menghitung total sales (sales) dan total discount (promotion_value) berdasarkan tahun(years) dan memformulisikan persentase burn rate nya (burn_rate_percentage). */
SELECT 
	LEFT(order_date,4) as years,
	SUM(sales) as sales,
	SUM(discount_value) as promotion_value,
	ROUND((SUM(discount_value) / SUM(sales)) * 100,2) AS burn_rate_percentage
FROM dqlab.dqlab_sales_store
WHERE
	order_status = 'Order Finished'
GROUP BY 1
ORDER BY 1;

/* . Promotion Effectiveness and Efficiency by Product Sub Category
Menganalisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini seperti pada bagian sebelumnya.   
Tapi ada kolom yang harus ditambahkan, yaitu : product_sub_category dan product_category */
SELECT 
	LEFT (order_date,4) as years,
	product_sub_category,
	product_category,
	SUM(sales) as sales,
	SUM(discount_value) as promotion_value,
	ROUND((SUM(discount_value)/SUM(sales))*100,2) as burn_rate_percentage
FROM dqlab.dqlab_sales_store
WHERE 
	order_status = 'Order Finished'
	AND LEFT(order_date,4) = 2012
GROUP BY 1,2,3
ORDER BY 4 DESC;

/* V. Customers Transactions per Year
DQLab Store ingin mengetahui jumlah customer (number_of_customer) yang bertransaksi setiap tahun dari 2009 sampai 2012 (years). */
SELECT
	LEFT(order_date,4) AS years,
    COUNT(distinct customer) as number_of_customer
FROM dqlab.dqlab_sales_store
WHERE
	order_status = 'Order Finished'
GROUP BY 1
ORDER BY 1;