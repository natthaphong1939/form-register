Feature: Register Page
    ผู้ใช้อยากจะกรอกข้อมูลเพื่อสมัครสมาชิกในการใช้งานระบบ

    Scenario: กรอกข้อมูลถูกต้องสมัครได้สำเร็จ
        Given ฉันกดปุ่มสมัครสมาชิก
        And ฉันกรอกชื่อ "Natthaphong"
        And ฉันกรอกนามสกุล "Thanawan"
        And ฉันกรอกวันเกิด "01-01-2546"
        And ฉันกรอกเพศ "Male"
        And ฉันกรอกอีเมล "dew@gmail.com"
        And ฉันกรอกเบอร์โทรศัพท์ "0987654321"
        And ฉันกรอกเรื่องทำงาน "Math"
        And ฉันกดสมัครสมาชิก
        Then ฉันจะเห็นหน้า "Registered Users"
        And เห็นข้อมูลของฉันดังนี้:
            | First Name  | Last Name    | Birthday   | Gender | Email           | Phone       | Subject |
            | Natthaphong | Thanawan     | 01-01-2546 | Male   | dew@gmail.com   | 0987654321  | Math    |