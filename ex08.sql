-- EMPLOYEES ���̺��� �������
-- ��ȭ��ȣ�� 011�� �����ϴ� ����鸸 ��ȸ�ؼ�
-- �ټ��� ���������� �����ַ��� �Ѵ�.
-- 3 �������� ǥ�õ� ������� ��ȸ�ϼ���.(16~20)
-- �̸���(first_name)���� �����ؼ� �����ּ���.
SELECT
    *
FROM
    (
        SELECT
            ROWNUM rno, e.*
        FROM
            (
                SELECT
                    *
                FROM
                    employees
                WHERE
                    phone_number LIKE '011%'
                ORDER BY
                    first_name
            ) e
    )
WHERE
    rno BETWEEN 11 AND 15
;

-- 16:40 �� JDBC ���� �����ϰڽ��ϴ�...
