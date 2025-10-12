# Lesson 09- provisioners

Experiment with provisioning resources.

- `user_data`
- Passing data
- Provisioners
- Connections

## Experiment - Provisioning

- Use the `09-provisioners` directory
- Use your S3 remote backend, but change the `key`
- Create one web server
- Create an EC2 key pair, and assign the key pair to the server to allow SSH connections
- Assign the security group `sg-0ecb08fae0faef285` (`allow_http_ssh`)
- Use `user-data.sh` to start a web server with the contents of `index.html.tftpl`
- Output 
  - the private IP address, so we can use `curl` from the command line
  - the public DNS name, so we can use our web browser
- **Stretch:** Make the `created_time` a human-friendly format
- **Stretch:** Find the security group by name, `allow_http_ssh`

### Hints

- Use the AWS `key-pair` module to create the SSH key
- Use the `templatefile()` function to render `index.html.tftpl`
- Use a `file` provisioner to push the `index.html` to `/home/ubuntu/`
- The default username is `ubuntu`
- You may need to taint the server for `user_data` and `index.html` changes
- Test from the command line with curl `http://privateIP:8080`
- Test from your browser with `http://publicDNS:8080`
