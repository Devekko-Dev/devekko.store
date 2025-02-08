docker compose up 

docker compose up store_pgvector_dev

docker compose up store-pgvector-dev

docker compose up store-ash-dev

07:16:01 niccolox@devekko devekko.store → docker compose up cuda
[+] Running 2/1
 ✔ Network devekkostore_default   Created                                                                                                                        0.1s 
 ✔ Container devekkostore-cuda-1  Created                                                                                                                        0.0s 
Attaching to cuda-1
cuda-1  | Thu Jan  9 03:16:31 2025       
cuda-1  | +-----------------------------------------------------------------------------------------+
cuda-1  | | NVIDIA-SMI 550.120                Driver Version: 550.120        CUDA Version: N/A      |
cuda-1  | |-----------------------------------------+------------------------+----------------------+
cuda-1  | | GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
cuda-1  | | Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
cuda-1  | |                                         |                        |               MIG M. |
cuda-1  | |=========================================+========================+======================|
cuda-1  | |   0  NVIDIA GeForce RTX 3050 ...    Off |   00000000:01:00.0 Off |                  N/A |
cuda-1  | | N/A   40C    P3             11W /   35W |       8MiB /   4096MiB |      0%      Default |
cuda-1  | |                                         |                        |                  N/A |
cuda-1  | +-----------------------------------------+------------------------+----------------------+
cuda-1  |                                                                                          
cuda-1  | +-----------------------------------------------------------------------------------------+
cuda-1  | | Processes:                                                                              |
cuda-1  | |  GPU   GI   CI        PID   Type   Process name                              GPU Memory |
cuda-1  | |        ID   ID                                                               Usage      |
cuda-1  | |=========================================================================================|
cuda-1  | +-----------------------------------------------------------------------------------------+
cuda-1 exited with code 0

docker compose up --build --watch

