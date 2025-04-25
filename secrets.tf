
resource "aws_secretsmanager_secret" "drupal_db_config" {
  name        = "prod/drupal/db-config-v2"
  description = "Drupal database configuration for ECS deployment"
}

resource "aws_secretsmanager_secret_version" "drupal_db_config_version" {
  secret_id     = aws_secretsmanager_secret.drupal_db_config.id

  secret_string = jsonencode({
    DB_HOST     = "drupal-db.xxxxxx.ap-southeast-1.rds.amazonaws.com",
    DB_NAME     = "drupal",
    DB_USER     = "drupaluser",
    DB_PASSWORD = "Drupal123!"
  })
}
