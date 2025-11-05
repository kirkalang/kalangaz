#!/bin/zsh

# Sync the folder to S3
echo "Sync to AWS S3"
echo.
echo "First perform a dryrun..."
aws s3 sync . s3://www.kalangaz.com --exclude ".git/*" --exclude "*.DS_Store" --exclude ".github/*" --exclude ".gitignore" --dryrun

echo "\n\n"
read "sync?Do you want to proceed with sync? [y/N] "

if [[ "$sync" == "y" ]]; then
   echo "\nProceeding..."
   aws s3 sync . s3://www.kalangaz.com --exclude ".git/*" --exclude "*.DS_Store" --exclude ".github/*" --exclude ".gitignore"
   echo "\n\nSync completed."
else
   echo "\n\nExiting."
   exit 1
fi

# sleep for 10 seconds and then force and invalidate cache
echo "\nsleep for 10 seconds."
sleep 10

echo "\nInvalidate the cloudfront cache"
aws cloudfront create-invalidation --distribution-id E2SVPW1V3KREBK --paths "/*"

echo "\nDone"