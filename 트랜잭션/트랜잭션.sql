-- 트랜잭션
CREATE SCHEMA tcl;
use tcl;

-- 초기 테이블 생성 (계좌)
CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_name VARCHAR(255) NOT NULL,		-- 계좌명
    balance BIGINT NOT NULL DEFAULT 0		-- 잔고 (기본값 0)
);

-- 로그 테이블 생성
CREATE TABLE transaction_log (
	transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,		-- 보낸 계좌 ID
    to_account INT,			-- 받은 계좌 ID
    amount BIGINT,			-- 보낸 금액양
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,	-- 보낸시간 (기본값 현재시간)
    FOREIGN KEY (from_account) REFERENCES accounts(account_id),
    FOREIGN KEY (to_account) REFERENCES accounts(account_id)
);