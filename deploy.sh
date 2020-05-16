docker build -t sujeetkp/multi-client:latest -t sujeetkp/multi-client:$SHA -f ./client/Dockerfile ./client 
docker build -t sujeetkp/multi-server:latest -t sujeetkp/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sujeetkp/multi-worker:latest -t sujeetkp/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sujeetkp/multi-client:latest
docker push sujeetkp/multi-server:latest
docker push sujeetkp/multi-worker:latest

docker push sujeetkp/multi-client:$SHA
docker push sujeetkp/multi-server:$SHA
docker push sujeetkp/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=sujeetkp/multi-server:$SHA
kubectl set image deployments/client-deployment client=sujeetkp/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sujeetkp/multi-worker:$SHA
