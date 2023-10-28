DROP TABLE IF EXISTS projects.project_category;
DROP TABLE IF EXISTS projects.category;
DROP TABLE IF EXISTS projects.step;
DROP TABLE IF EXISTS projects.material;
DROP TABLE IF EXISTS projects.project;




CREATE TABLE project(
	project_id INT AUTO_INCREMENT PRIMARY KEY,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT
);


CREATE TABLE material(
	materialid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);



CREATE TABLE step(
	step_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	project_id INT NOT Null,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);



CREATE TABLE category(
	category_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	category_name VARCHAR(128) NOT NULL
);

CREATE TABLE project_category(
	project_id INT UNIQUE,
	category_id INT UNIQUE,
	
	FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);