<?php 
include 'login_activity.php';
include 'office_header.php';
include 'conexaoAction.php';
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title>Listagem de Pets</title>
</head>
<body>
<section>
    <div class="container mt-4">
        <div class="form-container shadow-lg p-4 rounded">
            <h1 class="text-center mb-4 display-4">Listagem de Pets</h1>
            
            <!-- Formulário de Filtros -->
            <form method="GET" action="">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <input type="text" name="nome" class="form-control" placeholder="Nome Pet" value="<?= $_GET['nome'] ?? '' ?>">
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="rga" class="form-control" placeholder="RGA" value="<?= $_GET['rga'] ?? '' ?>">
                    </div>
                    <div class="col-md-3">
                        <select name="sexo" class="form-control">
                            <option value="">Sexo</option>
                            <option value="M" <?= ($_GET['sexo'] ?? '') == 'M' ? 'selected' : '' ?>>Macho</option>
                            <option value="F" <?= ($_GET['sexo'] ?? '') == 'F' ? 'selected' : '' ?>>Fêmea</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select name="especie" class="form-control">
                            <option value="">Espécie</option>
                            <option value="Cão" <?= ($_GET['especie'] ?? '') == 'Cão' ? 'selected' : '' ?>>Cão</option>
                            <option value="Gato" <?= ($_GET['especie'] ?? '') == 'Gato' ? 'selected' : '' ?>>Gato</option>
                        </select> 
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-3">
                        <input type="text" name="raca" class="form-control" placeholder="Raça" value="<?= $_GET['raca'] ?? '' ?>">
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="cor" class="form-control" placeholder="Cor" value="<?= $_GET['cor'] ?? '' ?>">
                    </div>
                    <div class="col-md-3">
                        <input type="number" name="idade" class="form-control" placeholder="Idade" value="<?= $_GET['idade'] ?? '' ?>">
                    </div>
                    <div class="col-md-3">
                        <select name="porte" class="form-control">
                            <option value="">Porte</option>
                            <option value="Pequeno" <?= ($_GET['porte'] ?? '') == 'Pequeno' ? 'selected' : '' ?>>Pequeno</option>
                            <option value="Médio"<?= ($_GET['porte'] ?? '') == 'Médio' ? 'selected' : '' ?>>Médio</option>
                            <option value="Grande"<?= ($_GET['porte'] ?? '') == 'Grande' ? 'selected' : '' ?>>Grande</option>
                    </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Filtrar</button>
                <a href="pet_listar.php" class="btn btn-secondary">Limpar Filtros</a>
            </form>
            
            <table class="table table-sm table-striped table-hover table-bordered border-primary rounded mt-4">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Código</th>
                        <th>Nome Pet</th>
                        <th>RGA</th>
                        <th>Sexo</th>
                        <th>Espécie</th>
                        <th>Raça</th>
                        <th>Cor</th>
                        <th>Idade</th>
                        <th>Porte</th>
                        <th>Excluir</th>
                        <th>Atualizar</th>
                    </tr>
                </thead>
                <tbody class="text-center">
     <?php

// Construir a consulta SQL com filtros
$conditions = [];
if (!empty($_GET['nome'])) $conditions[] = "nome LIKE '%" . $conexao->real_escape_string($_GET['nome']) . "%'";
if (!empty($_GET['rga'])) $conditions[] = "rga = '" . $conexao->real_escape_string($_GET['rga']) . "'";
if (!empty($_GET['sexo'])) $conditions[] = "sexo = '" . $conexao->real_escape_string($_GET['sexo']) . "'";
if (!empty($_GET['especie'])) $conditions[] = "especie LIKE '%" . $conexao->real_escape_string($_GET['especie']) . "%'";
if (!empty($_GET['raca'])) $conditions[] = "raca LIKE '%" . $conexao->real_escape_string($_GET['raca']) . "%'";
if (!empty($_GET['cor'])) $conditions[] = "cor LIKE '%" . $conexao->real_escape_string($_GET['cor']) . "%'";
if (!empty($_GET['idade'])) $conditions[] = "idade = " . (int)$_GET['idade'];
if (!empty($_GET['porte'])) $conditions[] = "porte LIKE '%" . $conexao->real_escape_string($_GET['porte']) . "%'";

$sql = "SELECT * FROM pet";
if (count($conditions) > 0) {
    $sql .= " WHERE " . implode(' AND ', $conditions);
}

$resultado = $conexao->query($sql);

if ($resultado != null) {
    foreach ($resultado as $linha) {
        echo '<tr>';
        echo '<td>' . $linha['id'] . '</td>';
        echo '<td>' . $linha['nome'] . '</td>';
        echo '<td>' . $linha['rga'] . '</td>';
        echo '<td>' . $linha['sexo'] . '</td>';
        echo '<td>' . $linha['especie'] . '</td>';
        echo '<td>' . $linha['raca'] . '</td>';
        echo '<td>' . $linha['cor'] . '</td>';
        echo '<td>' . $linha['idade'] . '</td>';
        echo '<td>' . $linha['porte'] . '</td>';
        echo '<td>
                <a href="pet_excluir.php?id=' . $linha['id'] . '">
                    <i class="fa fa-user-times"></i>
                </a>
              </td>';
        echo '<td>
                <a href="pet_atualizar.php?id=' . $linha['id'] . '">
                    <i class="fa fa-refresh"></i>
                </a>
              </td>';
        echo '</tr>';
    }
}
?>

                </tbody>
            </table>
        </div>
    </div>
</section>
</body>

<div style="height: 6vh;"></div>
<?php include 'office_footer.php'; ?>
</html>
