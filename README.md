#Purpose

The purpose of the project is a playground for explorong AWS, HTML, Web design, different web site frameworks and technologies. Also used as a personal website.

#Deployment

For deploying to the associated S3 container utilize the following syntax. Obviously you'll need to obtain access keys.

**Sync entire directory**

This is the preffered option as it only uploads updated and new files and allows including and excluding files using filename and path patterns.

```Bash
cd <root of kalangax project>
aws s3 sync . s3://www.kalangaz.com --exclude ".git/*" --exclude "*.DS_Store" --exclude ".github/*" --exclude ".gitignore"
```

**Upload a single file**

`aws s3 cp <path to local file> s3://www.kalangaz.com/<path to file in S3 bucket>`

