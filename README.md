# Data_Pipeline_With_Airflow_AWS_MWAA
Data Pipeline with Apache Airflow deployment with Terraform to AWS MWAA.
Note: Based on the MWAA Terraform GitHub code (https://github.com/idealo/terraform-aws-mwaa).

1. Create an AWS MWAA instance with Terraform by executing terraform init and terraform plan.
2. Create 4 valid subnets for the VPC IP range (2 for public and 2 for private).
3. Update Internet Gateway with the one created from the Terraform deployment.
4. Open up Web Server to allow public access.
5. Copy "airflow" folder to S3://foustairflowbucket/DAGs
6. Airflow code will be available after launching Apache Airflow UI.
7. Go to Airflow UI create connection page, enter the following values:
  -	Conn Id: Enter aws_credentials.
  -	Conn Type: Enter Amazon Web Services.
  -	Login: Enter your Access key ID from the IAM User credentials you downloaded earlier.
  -	Password: Enter your Secret access key from the IAM User credentials you downloaded earlier.
  Once you've entered these values, select Save and Add Another.
8. Create an AWS Redshift cluster.
9. Create another connection:
  -	Conn Id: Enter redshift.
  -	Conn Type: Enter Postgres.
  -	Host: Enter the endpoint of your Redshift cluster, excluding the port at the end. You can find this by selecting your cluster in the Clusters page of the Amazon Redshift console. See where this is located in the screenshot below. IMPORTANT: Make sure to NOT include the port at the end of the Redshift endpoint string.
  -	Schema: Enter dev. This is the Redshift database you want to connect to.
  -	Login: Enter aws user that has AmazonRedshiftFullAccess and AmazonS3ReadOnlyAccess permissions
  -	Password: Enter the password for your aws user when launching your Redshift cluster.
  -	Port: Enter 5439.
 10. Execute udac_example_dag DAG from Airflow UI.



