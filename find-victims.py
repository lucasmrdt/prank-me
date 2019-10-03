import socket
import threading

socket.setdefaulttimeout(1)

IP = socket.gethostbyname(socket.gethostname())
PORT = 6543

valid_ips = []
threads = []


def connection(ip, port):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((ip, port))
        valid_ips.append(ip)
    except Exception as e:
        pass

def main():
    BASE_IP = '.'.join(IP.split('.')[:-1])

    for i in range(1, 255):
        ip = f'{BASE_IP}.{i}'
        x = threading.Thread(
            target=connection,
            args=(ip, PORT),
            daemon=True)
        x.start()
        threads.append(x)

    for t in threads:
        t.join()

    print(f'We found {len(valid_ips)} active victims :')
    for ip in valid_ips:
        print(ip)

if __name__ == '__main__':
    main()
