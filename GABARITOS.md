# Gabaritos

## Exercícios de Fixação


  ### Utilizando o INNER JOIN:


  1 - Construa uma query que retorne todas as colunas da tabela *`Students`* e uma coluna com o **`status`** de aprovação da tabela **`Exams`**, dos alunos que tenham mais de 30 anos;

  * Solução:

    ```
    SELECT MySchool.Students.*, MySchool.Exams.exam_status as 'Aprovado' 
    FROM MySchool.Students
    INNER JOIN MySchool.Exams
    ON Exams.student_id = Students.id
    WHERE Students.age > 30;
    ```



  2 - Construa uma query que retorne uma coluna da tabela *`Students`* com o Nome Completo do aluno, uma coluna da tabela Exams com o *`status`* de aprovação do aluno, somente dos alunos que ja realizaram a prova (*`exam_status`*) e uma coluna da tabela *`Grades`* com a turma que ele pertence;

  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.status as 'Aprovado', G.grade as 'Turma'
    FROM MySchool.Students as S
    INNER JOIN MySchool.Exams as E
    ON E.status = 'Approved' AND E.student_id = S.id
    INNER JOIN MySchool.Grades as G
    ON S.id = G.student_id;
    ```


  ### Utilizando o LEFT JOIN:


  1 - Construa uma query que retorne todas as colunas da tabela Students e uma coluna da tabela *`Exams`* dos alunos que ja realizaram as provas;

  * Solução:

    ```
    SELECT MySchool.Students.*, IF(MySchool.Exams.exam_status = 1, 'Sim', 'Nao') as 'Prova Entregue'
    FROM MySchool.Students
    LEFT JOIN MySchool.Exams
    ON Exams.exam_status = true AND Exams.student_id = Students.id;
    ```

    - sem o **`IF()`**

      ```
      SELECT MySchool.Students.*, MySchool.Exams.exam_status as 'Prova Entregue'
      FROM MySchool.Students
      LEFT JOIN MySchool.Exams
      ON Exams.exam_status = true AND Exams.student_id = Students.id;
      ```

  2 - Construa uma query que retorne uma coluna da tabela *`Student`* com o alias **`Nome Completo`** com o nome aluno e todas as colunas da tabela *`Exams`*, relacionando apenas quem ja fez a **Prova**;


  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.*
    FROM MySchool.Students AS S
    LEFT JOIN MySchool.Exams AS E
    ON E.exam_status = true AND S.id = E.student_id;
    ```


  ### Utilizando o RIGHT JOIN:


  Para o RIGHT JOIN vamos apenas substituir o LEFT JOIN por RIGHT JOIN dos mesmos exercícios que fizemos acima. O importante e perceber e abstrair com bastante atenção. Bora ver?!

  
  1 - Construa uma query que retorne todas as colunas da tabela Students e uma coluna da tabela *`Exams`* dos alunos que ja realizaram as provas;

  * Solução:

    ```
    SELECT MySchool.Students.*, IF(MySchool.Exams.exam_status = 1, 'Sim', 'Nao') as 'Prova Entregue'
    FROM MySchool.Students
    RIGHT JOIN MySchool.Exams
    ON Exams.exam_status = true AND Exams.student_id = Students.id;
    ```

    - sem o **`IF()`**

      ```
      SELECT MySchool.Students.*, MySchool.Exams.exam_status as 'Prova Entregue'
      FROM MySchool.Students
      RIGHT JOIN MySchool.Exams
      ON Exams.exam_status = true AND Exams.student_id = Students.id;
      ```

  2 - Construa uma query que retorne uma coluna da tabela *`Student`* com o alias **`Nome Completo`** com o nome aluno e todas as colunas da tabela *`Exams`*, relacionando apenas quem ja fez a **Prova**;


  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.*
    FROM MySchool.Students AS S
    RIGHT JOIN MySchool.Exams AS E
    ON E.exam_status = true AND S.id = E.student_id;
    ```


## Exercícios

* Respostas:

  1º Requisito:

  * Elabore uma query que retorne todas as colunas da tabela **`artists`** e todas as colunas da tabela **`albums`** relacionadas ao id do Artista;

  * Solução:

  ```
  SELECT * 
  FROM SpotifyClone.artists AS Art
  INNER JOIN SpotifyClone.albums AS Alb
  ON Art.id = Alb.artist_id;
  ```


  2º Requisito:

  * Elabore uma query que retorne uma coluna do nome do artista com o alias **`Artista`** da tabela **`artists`**, uma coluna do nome do album com o alias **`Album`** da tabela **`albums`** e uma coluna do nome da musica com o alias **`Musica`** da tabela **`tracks`**, com base nos dados relacionados;


  * Solução:

  ```
  SELECT Art.artist_name AS 'Artista', Alb.album_name AS 'Album', Tk.track AS 'Musica'
  FROM SpotifyClone.artists AS Art
  INNER JOIN SpotifyClone.albums AS Alb
  ON Art.id = Alb.artist_id
  INNER JOIN SpotifyClone.tracks as Tk
  ON Tk.album_id = Alb.id;
  ```


  3º Requisito:




