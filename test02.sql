-- test02 �������� �����ؼ� �۾�

CREATE OR REPLACE VIEW shono
AS
    SELECT
        no
    FROM
        test01
;

GRANT CREATE VIEW TO test01;

GRANT SELECT ANY TABLE TO test01;

REVOKE CREATE VIEW FROM test01;


SELECT
    *
FROM
    scott.emp
WHERE
    deptno = 10
;

SELECT
    *
FROM
    jennie.member
;

-- test01���� ������ �ټ� �ִ� ���ѱ��� �����ؼ� scott.emp �� ��ȸ�ϴ� ������ �ּ���.
GRANT SELECT ON scott.emp TO test01 WITH GRANT OPTION;