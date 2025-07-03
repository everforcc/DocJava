
-- 创建小说简介表
CREATE TABLE cc_craw_book_info (
                                   id BIGINT PRIMARY KEY,
                                   auther_id VARCHAR(500),
                                   name VARCHAR(100),
                                   pic VARCHAR(500),
                                   description TEXT
);

-- 创建小说章节列表
CREATE TABLE cc_craw_book_capter (
                                     id BIGINT PRIMARY KEY,
                                     book_id BIGINT,
                                     name VARCHAR(100),
                                     `order` INT,
                                     common TEXT,
                                     FOREIGN KEY (book_id) REFERENCES cc_craw_book_info(id)
);

-- 创建小说章节内容
CREATE TABLE cc_craw_book_content (
                                      id BIGINT PRIMARY KEY,
                                      chapter_id BIGINT,
                                      content TEXT,
                                      `order` INT,
                                      common TEXT,
                                      FOREIGN KEY (chapter_id) REFERENCES cc_craw_book_capter(id)
);