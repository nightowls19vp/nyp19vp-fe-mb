import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.orange,
                width: 2.0,
              ),
            ),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.white,
              backgroundImage: AssetImage('assets/images/owl.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông tin cá nhân',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.editProfile);
                  },
                  child: Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEEACD),
                  border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tên đăng nhập:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'chauho_1911',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Họ tên:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hồ Ngọc Minh Châu',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'abc@xyz.com',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số điện thoại:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '0931564102',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ngày sinh: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '19/11/2001',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tài khoản liên kết',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFEEACD),
                  border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  height:
                                      24), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 12),
                              Text(
                                'Tài khoản Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Liên kết',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Image.asset('assets/images/facebook.png',
                                height: 24), // <-- Use 'Image.asset(...)' here
                            SizedBox(width: 12),
                            Text(
                              'Tài khoản Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Liên kết',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
