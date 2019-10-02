import socket
import threading

socket.setdefaulttimeout(1)

valid_ips = []
threads = []

def connection(ip, port):
    try:
        print(f'try to connect to {ip}:{port}')
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((ip, port))
        valid_ips.append(ip)
        print(f'✅ success to connect to {ip}:{port}')
    except Exception as e:
        print(f'❌ fail to connect to {ip}:{port}')
        pass

for i in range(1, 256):
    x = threading.Thread(target=connection, args=(f'10.10.252.{i}', 7654), daemon=True)
    x.start()
    threads.append(x)

for t in threads:
    t.join()

print(valid_ips)
