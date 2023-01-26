# 1
docker build -t anis/pyscript:latest -f Dockerfile --build-arg agr1=1 --build-arg arg2=1 .
docker run anis/pyscript

# 2
docker build -t anis/rbscript:latest -f Dockerfile .
docker run anis/rbscript

# 3
docker build -t anis/rbscript_unittest:latest -f Dockerfile .
docker run anis/rbscript_unittest

# 4
npm install moment
docker build -t anis/nodejs_script:latest -f Dockerfile .
docker run anis/nodejs_script

# 5
npx express-generator HelloWorld --view=pug
cd .\HelloWorld\
npm install
npm start
docker build -t anis/nodeexpress:latest -f Dockerfile --build-arg arg=3000 .
docker run -d -p 3001:3000 anis/nodeexpress

# 6
docker-compose build
docker-compose up
