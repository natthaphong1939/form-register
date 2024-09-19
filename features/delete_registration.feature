Feature: Delete Registration
    ผู้ใข้อยากจะลบข้อมูล

    Scenario: ลบข้อมูล
        Given ฉันเห็นข้อมูลของฉันดังนี้:
            | First Name  | Last Name    | Birthday   | Gender | Email           | Phone       | Subject |
            | Natthaphong | Thanawan     | 01-01-2546 | Male   | dew@gmail.com   | 0987654321  | Math    |
        When ฉันกดลบข้อมูลของฉัน
        Then ข้อมูลของฉันจะหายไป