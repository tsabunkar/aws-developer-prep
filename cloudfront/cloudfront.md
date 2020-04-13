# CloudFront

- CloudFront is Amazons content delivery network.
- CDN :
  - A content delivery network (CDN) is a system of distributed servers(network) that deliver webpages and other web content to a user based on the geographic locations of the user, the origin of the webpage, and a content delivery server.
  - Its is webservice which speeds up your static and dynamic web content.
  - Instead of making call to server which is placed far from the geolocation of the user (that introduces Latency) we make call to edge locations which are placed very near to users geolocation.Thus Edgelocation has cached data of actual servers.(When new data is avaliable in server, push-notification -> data is pused from servers to Edge locations)
- CloudFront - key Terminology
  - Edge location: This is the location where content is cached and can also be written. Separate to an AWS Region/AZ (Avaliablity Zone).
  - Origin: This is the origin of all the files that the CDN will distribute. Origins can be an S3 Bucket, an EC2 Instance, an Elastic Load Balancer, or Route53.
  - Distributon: This is the name given the CDN, which consits of a collection of Edge locations. There are 2 types of distribution
    - Web Distribution: Typically used for websites.
    - RTMP: Used for Media Streaming.
- Amazon CloudFront can be used to deliver your entier website, including dynamic, static, streaming, and interactive content using a global network of edge locations. Requests for your content are automatically rotued to the nearest edge location, so content is delivered with the best possible performance.
  ex: Can be used to optimize performance for users accessing a website backed by S3.
- Amazon CloudFront is optimized to work with other Amazon Web Services like Simple Storage Service (S3), Amazon Elastic Compute Cloud (EC2), Elastic Load balancing and Amazon Route 53.
- Amazon CloudFront also works seamlessly with any non-AWS origin server, which stores the original, definitive versions of your files.
- CloudFront Ditribution types:
  - Web Distribution: Used for Websites, HTTP / HTTPS
  - RTMP Distribution: (Adobe Real Time Messaging Protocol Used for Media Streaming / Flash multi-media content)
- CloudFront and S3 Transfer Acceleration
  - Amazon S3 Transfer Acceleration enables fast, easy and secure transfer of files over distances between your end users and S3 bucket.
  - Transfer Acceleration takes advantage of Amazon CloudFront's globally distributed edge locations. As the data arrives at an edge location, data is routed to Amazon S3 over an optimized network path.

---

# Exam Tips for CloudFront

- Edge Location: This is the location where cotent will be cached. This is separate to an AWS Region/AZ.
- Origin: This is the origin of all the files that the CDN will distribute. Origins can be an S3 bucket, an EC2 instance, an Elastic load balancer, or Route53.
- Distrubtion: This is the name given the CDN, which consists of a collection of Edge Locations.
  - Web Distribution: Typically used for websites.
  - RTMP: Used for Media Streaming.
- Edge locations are not just READ Only- you can WRITE to them too. (i.e.- PUT an object on to them).
- CloudFront Edge Locations are utilised by S3 Transfer Acceleration to reduce latency for S3 uploads.
- Objects are cached for the life of the TTL (Time To Live)
- You can clear cached objects, but you will be charged.

---
