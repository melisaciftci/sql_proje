CREATE TABLE members (
	member_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	member_password VARCHAR(255) UNIQUE NOT NULL,
	register_time TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
	member_name VARCHAR(50) NOT NULL,
	member_lastname VARCHAR(50) NOT NULL
);

INSERT INTO members (username, email, member_password, member_name, member_lastname)
VALUES 
('emir_ozdemir', 'emir.ozdemir@gmail.com', '12345678', 'Emir', 'Özdemir'),
('zeynep_karaca', 'zeynep.karaca@hotmail.com', 'zeynep123', 'Zeynep', 'Karaca'),
('ahmet_yildirim', 'ahmet.yildirim@outlook.com', 'ahmet789', 'Ahmet', 'Yıldırım');

select * from members;

select * from course;

CREATE TABLE course (
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(200) UNIQUE NOT NULL,
	course_text TEXT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	courser_info VARCHAR(100) NOT NULL
);

INSERT INTO course (course_name, course_text, start_date, end_date, courser_info)
VALUES 
('Python’a Giriş', 'Python programlama diline yeni başlayanlar için temel konular.', '2025-05-15', '2025-06-30', 'Başlangıç seviyesindeki programcılar için ideal'),
('React ile Web Geliştirme', 'React ile modern web uygulamaları geliştirmeyi öğrenin.', '2025-06-01', '2025-07-15', 'İleri düzey JavaScript bilgisi gereklidir'),
('Veri Bilimi Temelleri', 'Veri bilimi ve temel analiz yöntemleri hakkında bir giriş.', '2025-07-10', '2025-08-10', 'Veri analizi ile ilgilenenler için');

select * from categories;

CREATE TABLE categories (
	category_id SMALLSERIAL PRIMARY KEY,
	ai VARCHAR(100),
	blockchain VARCHAR(100),
	cyber_security VARCHAR(100),
	data_science VARCHAR(100)
);

INSERT INTO categories (ai, blockchain, cyber_security, data_science)
VALUES 
('Makine Öğrenimi', 'Blockchain Uygulamaları', 'Ağ Güvenliği', 'Veri Analizi'),
('Derin Öğrenme', 'Kripto Para', 'Veri Sızıntısı', 'Makine Öğrenimi'),
('Yapay Zeka', 'Akıllı Sözleşmeler', 'Siber Saldırılar', 'Yapay Zeka ile Veri Analizi');


select * from enrollments;

CREATE TABLE enrollments (
	enrollment_id SMALLSERIAL PRIMARY KEY,
	member_id INT NOT NULL,
	course_id INT NOT NULL,
	enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (member_id) REFERENCES members(member_id),
	FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO enrollments (member_id, course_id)
VALUES 
(1, 1), 
(2, 2),  
(3, 3);  

select * from certificates;

CREATE TABLE certificates (
	certificate_id SERIAL PRIMARY KEY,
	certificate_code VARCHAR(100) UNIQUE NOT NULL,
	certificate_name VARCHAR(100) NOT NULL,
	certificate_date DATE NOT NULL DEFAULT CURRENT_DATE
);

ALTER TABLE certificates 
ALTER COLUMN certificate_code SET DEFAULT 'AutoCode';

INSERT INTO certificates (certificate_code, certificate_name, certificate_date)
VALUES 
('PY101', 'Python Giriş Sertifikası', '2025-06-30'),
('REACT_ADVANCED', 'React İleri Düzey Sertifikası', '2025-07-15'),
('DSFUNDAMENTALS', 'Veri Bilimi Temelleri Sertifikası', '2025-08-10');

select * from assignments;

CREATE TABLE assignments (
	assignment_id SERIAL PRIMARY KEY,
	member_id INT NOT NULL,
	certificate_id INT NOT NULL,
	assignment_date DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (member_id) REFERENCES members(member_id),
	FOREIGN KEY (certificate_id) REFERENCES certificates(certificate_id)
);

INSERT INTO assignments (member_id, certificate_id, assignment_date)
VALUES 
(1, 1, '2025-06-30'),  
(2, 2, '2025-07-15'),  
(3, 3, '2025-08-10'); 

select * from blog_posts;

CREATE TABLE blog_posts(
	blog_post_id SERIAL PRIMARY KEY,
	blog_header VARCHAR(255) NOT NULL,
	blog_context TEXT NOT NULL,
	publication_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	member_id INT NOT NULL,
	FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO blog_posts (blog_header, blog_context, member_id)
VALUES 
('Python ile Başlangıç', 'Python programlamaya başlamak istiyorsanız, doğru yerdesiniz! Basit ama etkili ipuçlarıyla öğrenmeye başlayabilirsiniz.', 1),  
('React ile Dinamik Web Sayfaları', 'React kullanarak dinamik web sayfaları oluşturmak gerçekten çok keyifli. Bu yazımda size temel adımları anlatacağım.', 2),  
('Veri Bilimi: Temel Kavramlar ve Uygulamalar', 'Veri bilimini anlamak için ilk adımlar önemli. Bu yazıda, temel kavramlardan ve popüler araçlardan bahsedeceğim.', 3);  



