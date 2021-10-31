# V2Ray Heroku

** Để triển khai V2Ray VLESS, vui lòng truy cập chi nhánh [vless](https://github.com/QuocTrieuDev/v2ray-heroku/tree/vless). **

## Tổng quan

Dự án này được sử dụng để triển khai V2Ray WebSocket trên Heroku, trong phạm vi sử dụng hợp lý, hình ảnh này sẽ không bị chặn do lượng tài nguyên lớn.

Sau khi triển khai, mỗi khi bạn khởi động ứng dụng, V2Ray đang chạy sẽ luôn là phiên bản mới nhất.

## Triển khai

### Các bước

 1. Chuyển dự án này vào tài khoản GitHub của bạn (sử dụng `example` làm ví dụ)
 2. Sửa đổi tên dự án, hãy cẩn thận không bao gồm các từ khóa `v2ray` và` heroku` (tên dự án đã sửa đổi sử dụng `demo` làm ví dụ)
 3. Sửa đổi `README.md`, thay thế `QuocTrieuDev/v2ray-heroku/` bằng nội dung của riêng bạn (chẳng hạn như `example / demo`)

>[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https://github.com/QuocTrieuDev/v2ray-heroku/)

 4. Quay lại trang chủ của dự án, nhấp vào liên kết ở trên để triển khai V2Ray

### Biến đổi

Các tên biến cần được đặt trong quá trình triển khai được giải thích như sau.

| Biến | Giá trị mặc định | Mô tả |
| :--- | :--- | :--- |
| `ID` | `dd71329d-accd-476f-beef-167f625cf19a` | ID người dùng VLESS, dùng để xác thực, ở định dạng UUID |
| `AID` | `64` | Để tránh bị phát hiện thêm, hãy đặt ID bổ sung, AlterID, với phạm vi từ 0 đến 65535 |
| `WSPATH` | `/` | Đường dẫn giao thức HTTP được WebSocket sử dụng |

## Kết nối CloudFlare

Hai phương pháp sau có thể kết nối ứng dụng với CloudFlare, từ đó tăng tốc độ ở một mức độ nhất định.

 1. Liên kết tên miền với ứng dụng và kết nối tên miền với CloudFlare
 2. Reverse proxy thông qua CloudFlare worker

## Lưu ý

 1. ** Xin đừng lạm dụng dự án này, có rất ít dịch vụ miễn phí như Heroku, và hãy sử dụng nó và trân trọng nó **
 2. Nếu bạn sử dụng tên miền để truy cập CloudFlare, vui lòng xem xét bật TLS 1.3
 3. Hầu hết các địa chỉ AWS IPv4 đã bị Twitter chặn
