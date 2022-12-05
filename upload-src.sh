# without sandbox please move creation of the bucket to terraform
sh setup_src_bucket.sh

mkdir build

echo "zip files for server"
cd monitor-server
zip ../build/monitor-server.zip requirements.txt
zip -r ../build/monitor-server.zip src 
cd ..

echo  "upload to s3"
aws s3 cp build/monitor-server.zip s3://email-monitor-jay/


mkdir infrastructure/build

cd job-crawer-data/src
zip -r ../../infrastructure/build/job_crawler.zip .
cd ../..

cd notifier/src
zip -r ../../infrastructure/build/notifier.zip .
cd ../..

cd requests-layer
pip3 install -r requirements.txt --target python/lib/python3.9/site-packages
zip -r ../build/requests-layer.zip .
cd ..

echo  "upload to s3"
aws s3 cp build/requests-layer.zip s3://email-monitor-jay/
