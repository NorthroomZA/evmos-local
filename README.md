# evmos-local
Run a local instance of the evmos chain

# How to use
Requirements:
- docker
- docker-compose
- Make
- ports open
    - 26657
    - 26656

Run:
```
make init

make start-wl #with logs
or 
make start-d #without logs
```
Run fresh:
```
make clean
```