# Gabaritos

## Exercícios de Fixação
## Exercícios

* Respostas:

  1º Requisito:

  * Elabore uma query que retorne todas as colunas da tabela **artists** e todas as colunas da tabela **albums** relacionadas ao id do Artista;

  * Solução:

  ```
  SELECT * 
  FROM SpotifyClone.artists AS Art
  INNER JOIN SpotifyClone.albums AS Alb
  ON Art.id = Alb.artist_id;
  ```


  2º Requisito:

  * Elabore uma query que retorne uma coluna do nome do artista com o alias **Artista** da tabela **artists**, uma coluna do nome do album com o alias **Album** da tabela **albums** e uma coluna do nome da musica com o alias **Musica** da tabela **tracks**, com base nos dados relacionados;


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




