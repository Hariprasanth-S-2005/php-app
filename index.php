<?php
$pdo = new PDO(
  "mysql:host=" . getenv('DB_HOST') . ";dbname=" . getenv('DB_NAME'),
  getenv('DB_USER'),
  getenv('DB_PASS')
);
$rows = $pdo->query("SELECT * FROM todos")->fetchAll();
?>
<h2>To-Do List</h2>
<form method="POST">
<input name="task" required>
<button>Add</button>
</form>
<ul>
<?php foreach ($rows as $r): ?>
<li><?= htmlspecialchars($r['task']) ?></li>
<?php endforeach; ?>
</ul>
