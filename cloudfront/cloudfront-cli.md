# CloudFront Lab-> Creating a CloudFront distribution or CDN

- AWS Management Console > Storage > S3 > Create bucket
- (Create s3 bucket such that your very far from that place)
- bucket name : tsabunkar-cloudfront
  Region: Asia Pacific (Sydney)
- Deselect : Block all public access (Public access)
- Go to bucket created > upload
- Add file > image [Make sure its large image size, in order to see its loading from australia]
  - Manage public permissions : Grant public read access to this object(s)
  - Upload (See the progress is slow, bcoz we are uploading the file in other side of the world)
- Click on the image file
- Link : (Click on the Object URL) --> [Loading of image is very slow][thus we can use cloud front distribution, in order to speed up loading time of static files as using nearest edge loaction servers rather than very far georaphic loaction like- sydney ]

# Using Cloud front distribution for static image uploaded in Sydney Server - S3 bukcet

- Services > Networking & Content Delivery > CloudFront
- Create Distribution
- Select a delivery method for your content : Web > Get Started
- Create Distribution :
  - Origin Domain Name : (Select s3 bucket i.e-tsabunkar-cloudfront) tsabunkar-cloudfront.s3.amazonaws.com
  - Origin Path : (folder name for our static assets) --leave_it_blank---
  - Origin ID : S3-tsabunkar-cloudfront
  - Restrict Bucket Access : Yes
  - Origin Access Identity : (Special cloud front user who can access s3 bucket)
  - Grant Read Permissions on Bucket : Yes, Update Bucket Policy
  - Viewer Protocol Policy : Redirect HTTP to HTTPS
  - Create Distribution
- Go to Distributions > Your distribution created is in progress [15mins]
- (If state of distribution is Enabled)
- (Click on the distribution which was created)
- (See) Domain Name : d2u8e42k5xj6oh.cloudfront.net [Domain name of CDN]
- Goto S3 > tsabunkar-cloudfront > open Object URL (Now you can see that still image loaded very slow)
- [Let us force the user to open from cloudfront rather than this Object URL]
- Permissions
- Public access > (Select) Everyone > Access to the object : (de-select) Read object > Save
- Now try to access the this image by Object URL > Access denied bcoz we have removed public access
- Goto Cloudfront > General > copy the domain name : d2u8e42k5xj6oh.cloudfront.net
- (use domain name as preffix for the image file name)
  - ex:
    - Object URL : https://tsabunkar-cloudfront.s3-ap-southeast-2.amazonaws.com/IMG_20180902_160714.jpg
    - Domain Name (Cloudfront Distribution) : d2u8e42k5xj6oh.cloudfront.net
    - Use domain name + image name: https://<domain_name>/<file_name>
      - https://d2u8e42k5xj6oh.cloudfront.net/IMG_20180902_160714.jpg
    - (Now you can see that image loaded is very fast ;) ==> This is bcoz of image is loading from cached server which is present in near by edge server for particular users

---
