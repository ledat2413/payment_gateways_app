# payment_gateways_app

 Ứng dụng Payment Demo được xây dựng dựa trên những yếu tố: 

1. Architectural: Clean Architecture + Modularization
    - Để đảm bảo khả năng bảo trì và khả năng mở rộng, tôi sẽ sử dụng Clean Architecture + Modularization. Điều này sẽ cho phép tách biệt và dễ dàng trao đổi hoặc mở rộng các chức năng.

2. Handling Multiple Payment Gateways
    - Vì ứng dụng cần hỗ trợ nhiều cổng thanh toán (ví dụ: Stripe, PayPal,...), nên tôi sẽ sử dụng Dependency Injection and Factory Patterns cho các nhà cung cấp thanh toán trừu tượng.

3. Supporting Multiple Authentication Methods
    - Ứng dụng này sẽ hỗ trợ các tính năng Authentication như : Email & Password Authentication, Firebase Sign-In, Facebook Sign-In, Google Sign-In,...

4. Integrating Third-Party Services
    - Ứng dụng có thể kết nối với Firebase, Push Notifications,

5. State Management
    - Có rất nhiều cách để quản lí State, tôi sẽ sử dụng: Provider cho dependency injection and state management.

6. Scalability Considerations
    - Modular Approach: Mô-đun hóa dựa trên tính năng cho phép phát triển và thử nghiệm độc lập.
    - Loose Coupling with Interfaces: Cổng thanh toán mới, phương thức xác thực hoặc dịch vụ của bên thứ ba có thể được thêm vào với những thay đổi tối thiểu.
    - Error Handling & Logging: Xử lý lỗi tập trung bằng cách sử dụng CatchError hoặc có thể sử dụng Firebase Crashlytics.
