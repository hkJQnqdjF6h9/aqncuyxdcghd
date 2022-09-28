### コンテナ起動

- PowerShell
```powershell: PowerShell
docker run -d `
 -e POSTGRES_USER=postgres `
 -e POSTGRES_PASSWORD=postgres `
 -e POSTGRES_INITDB_ARGS="--encoding=UTF-8" `
 -e TZ=Asia/Tokyo `
 -v ${pwd}/init_sql:/docker-entrypoint-initdb.d `
 -p 5432:5432 `
 postgres:14
```