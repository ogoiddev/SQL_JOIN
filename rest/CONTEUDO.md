# Gabaritos

## Exercícios de Fixação


  ### Utilizando o INNER JOIN:


  1 - Construa uma query que retorne todas as colunas da tabela *`Students`* e uma coluna com o **`status`** de aprovação com o alias **`Aprovado`**  da tabela **`Exams`**, dos alunos que tenham mais de 30 anos;

  * Solução:

    ```
    SELECT MySchool.Students.*, MySchool.Exams.exam_status as 'Aprovado' 
    FROM MySchool.Students
    INNER JOIN MySchool.Exams
    ON Exams.student_id = Students.id
    WHERE Students.age > 30;
    ```

  -- ------------------------------

  2 - Construa uma query que retorne uma coluna da tabela *`Students`* com o Nome Completo do aluno e com o alias **`Nome Completo`**, uma coluna da tabela **`Exams`** com o *`status`* de aprovação do aluno com o alias **`Aprovado`** somente dos alunos que já realizaram a prova (*`exam_status`*) e uma coluna da tabela *`Grades`* com o alias **`Turma`** com da turma que ele pertence;

  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.status as 'Aprovado', G.grade as 'Turma'
    FROM MySchool.Students as S
    INNER JOIN MySchool.Exams as E
    ON E.status = 'Approved' AND E.student_id = S.id
    INNER JOIN MySchool.Grades as G
    ON S.id = G.student_id;
    ```

  -- ------------------------------
  ### Utilizando o LEFT JOIN:


  1 - Construa uma query que retorne todas as colunas da tabela Students e uma coluna da tabela *`Exams`* dos alunos que já realizaram as provas com o alias **`Prova Entregue`**;

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


  -- ------------------------------


  2 - Construa uma query que retorne uma coluna da tabela *`Student`* com o alias **`Nome Completo`** com o nome aluno e todas as colunas da tabela *`Exams`*, buscando apenas quem já fez a **Prova**;


  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.*
    FROM MySchool.Students AS S
    LEFT JOIN MySchool.Exams AS E
    ON E.exam_status = true AND S.id = E.student_id;
    ```

  -- ------------------------------
  ### Utilizando o RIGHT JOIN:


  Para o **`RIGHT JOIN`** vamos apenas substituir o **LEFT JOIN** por **RIGHT JOIN** e refazer os mesmos exercícios que fizemos acima ok?!. O importante é perceber e abstrair com bastante atenção o retorno da sua query.

  
  1 - Construa uma query que retorne todas as colunas da tabela Students e uma coluna da tabela *`Exams`* dos alunos que já realizaram as provas com o alias **`Prova Entregue`**;

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

  -- ------------------------------


  2 - Construa uma query que retorne uma coluna da tabela *`Student`* com o alias **`Nome Completo`** com o nome aluno e todas as colunas da tabela *`Exams`*, buscando apenas quem já fez a **Prova**;


  * Solução:

    ```
    SELECT CONCAT(S.first_name, ' ', S.last_name) AS 'Nome Completo', E.*
    FROM MySchool.Students AS S
    RIGHT JOIN MySchool.Exams AS E
    ON E.exam_status = true AND S.id = E.student_id;
    ```

  -- ------------------------------
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


  -- ------------------------------


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

  -- ------------------------------

  3º Requisito:

  * Elabore uma query que retorne todas as musicas da tabela **`tracks`** em um coluna com o alias **`Musica`** e uma coluna com o alias **`Reproduzida em`** da tabela **`play_history`**, com base nos dados relacionados;


  * Solução:

    ```
    SELECT Tk.track as 'Musica', Ph.date as 'Reproduzida em'
    FROM SpotifyClone.tracks as Tk
    LEFT JOIN SpotifyClone.play_history as Ph
    ON Tk.id = Ph.track_id;
    ```

  -- ------------------------------


  4º Requisito:

  * Elabore uma query que retorne uma coluna da tabela **`users`** com o nome do usuário e o alias **Usuário**, uma coluna com todas as musicas da tabela **`tracks`** e com o alias **Musica** e uma coluna com o alias **`Reproduzida em`** da tabela **`play_history`**, com base nos dados relacionados pelo **ID** do usuário;


  * Solução:

    ```
    SELECT Usr.user_name as 'Usuário', Tk.track as 'Musica', Ph.date as 'Reproduzida em'
    FROM SpotifyClone.users as Usr
    INNER JOIN SpotifyClone.play_history as Ph
    ON Usr.id = Ph.user_id
    RIGHT JOIN SpotifyClone.tracks as Tk
    ON Tk.id = Ph.track_id;
    ```

  -- ------------------------------

  5º Requisito:

  * Elabore uma query que retorne uma coluna da tabela **`users`** com o nome do usuário com o alias **Usuário** e uma coluna com os artistas que cada usuário segue;


  * Solução:

    ```
    SELECT Usr.user_name as 'Usuário', Art.artist_name as 'Segue o Artista'
    FROM SpotifyClone.users as Usr
    INNER JOIN SpotifyClone.followed_artist as Fa
    ON Usr.id = Fa.user_id
    INNER JOIN SpotifyClone.artists as Art
    ON Fa.artist_id = Art.id
    ORDER BY Usuário;
    ```

  -- ------------------------------
  6º Requisito:

  * Elabore uma query que retorne uma tabela com uma coluna da tabela **`users`** com o nome do usuário e com o alias **Usuário**, uma coluna da tabela **`plans`** com o nome do plano e com o alias **`Plano`** e uma coluna com o preço com o alias **`Preço`**;


  * Solução:

    ```
    SELECT Usr.user_name as 'Usuário', Pl.plan as 'Plano', Pl.price as 'Preço'
    FROM SpotifyClone.users AS Usr
    INNER JOIN SpotifyClone.plans AS Pl
    ON Usr.plan_id = Pl.id;
    ```

## BÔNUS

  * Respostas: 

  1º Requisito:

  * Elabore uma query que retorne na primeira coluna o usuário com o alias **`Usuário`**, na segunda coluna o nome das músicas que ele reproduziu com o alias **`Música`**, na terceira coluna o nome do album da música com o alias **`Álbum`**, na quarta coluna o nome do artista com o alias **`Artista`** e na ultima coluna a data e hora que a música foi reproduzida com o alias **`Reproduzida em`**. Ordene em ordem alfabética pela coluna **`Usuário`**;


  * Solução:

    ```
    SELECT Usr.user_name as 'Usuário', Tk.track as 'Musica', Al.album_name as 'Album', Art.artist_name as 'Artista', Ph.date as 'Reproduzida em'
    FROM SpotifyClone.users as Usr
    INNER JOIN SpotifyClone.play_history as Ph
    ON Usr.id = Ph.user_id
    INNER JOIN SpotifyClone.tracks as Tk
    ON Tk.id = Ph.track_id
    INNER JOIN SpotifyClone.albums as Al
    ON Tk.album_id = Al.id
    INNER JOIN SpotifyClone.artists as Art
    ON Al.artist_id = Art.id
    ORDER BY Usuário;
    ```

  -- ------------------------------

  2º Requisito:

  * Elabore uma query com as mesmas exigências do 1º requisito BONUS, mas agora retornando todas as musicas na coluna **`Musica`**, mesmo que ela nao tenha sido reproduzida. Ordene em ordem alfabética pela coluna **`Usuário`**;

  * Solução:

    SELECT Usr.user_name as 'Usuário', Tk.track as 'Musica', Al.album_name as 'Album', Art.artist_name as 'Artista', Ph.date as 'Reproduzida em'
    FROM SpotifyClone.users as Usr
    INNER JOIN SpotifyClone.play_history as Ph
    ON Usr.id = Ph.user_id
    RIGHT JOIN SpotifyClone.tracks as Tk
    ON Tk.id = Ph.track_id
    INNER JOIN SpotifyClone.albums as Al
    ON Tk.album_id = Al.id
    INNER JOIN SpotifyClone.artists as Art
    ON Al.artist_id = Art.id
    ORDER BY Usuário;


  -- ------------------------------

  3º Requisito:

  * Elabore uma query que retorne na primeira coluna o usuário com o alias **`Usuário`**, na segunda coluna os nomes dos artistas que ele segue com o alias **`Segue o Artista`**, na terceira coluna os nomes das musicas que ele ja ouviu com o alias **`Ja ouviu a musica`** e na ultima coluna a data e hora que a música foi reproduzida com o alias **`Reproduzida em`**. Ordene em ordem alfabética pela coluna **`Usuário`**;


  * Solução:

    ```
    SELECT Usr.user_name as 'Usuário', Art.artist_name as 'Segue o Artista', Tk.track as 'Ja ouviu a musica', Ph.date as 'Reproduzida em'
    FROM SpotifyClone.users as Usr
    INNER JOIN SpotifyClone.followed_artist as Fa
    ON Usr.id = Fa.user_id
    INNER JOIN SpotifyClone.artists as Art
    ON Fa.artist_id = Art.id
    INNER JOIN SpotifyClone.play_history as Ph
    ON Ph.user_id = Usr.id
    INNER JOIN SpotifyClone.tracks as Tk
    ON Tk.id = Ph.track_id
    ORDER BY Usuário;
    ```

  -- ------------------------------