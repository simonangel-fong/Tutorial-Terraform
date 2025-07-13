resource "aws_dynamodb_table" "user_trip_duration" {
  name         = "user_trip_duration"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "dim_year"
  range_key    = "dim_user_type_id"

  attribute {
    name = "dim_user_type_id"
    type = "N"
  }

  attribute {
    name = "dim_year"
    type = "N"
  }

  # import table from S3
  import_table {
    s3_bucket_source {
      bucket     = aws_s3_bucket.bucket_data.id
      key_prefix = "user_trip_duration"
    }
    input_format           = "CSV"
    input_compression_type = "NONE"
  }


  tags = {
    Name = "dynamo_user_trip_duration"
  }
}

resource "aws_dynamodb_table" "time_trip" {
  name         = "time_trip"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "dim_year"
  range_key    = "dim_month"

  attribute {
    name = "dim_year"
    type = "N"
  }

  attribute {
    name = "dim_month"
    type = "N"
  }

  # import table from S3
  import_table {
    s3_bucket_source {
      bucket     = aws_s3_bucket.bucket_data.id
      key_prefix = "time_trip"
    }
    input_format           = "CSV"
    input_compression_type = "NONE"
  }

  tags = {
    Name = "time_trip"
  }
}

resource "aws_dynamodb_table" "time_duration" {
  name         = "time_duration"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "dim_year"
  range_key    = "dim_month"

  attribute {
    name = "dim_year"
    type = "N"
  }

  attribute {
    name = "dim_month"
    type = "N"
  }

  # import table from S3
  import_table {
    s3_bucket_source {
      bucket     = aws_s3_bucket.bucket_data.id
      key_prefix = "time_duration"
    }
    input_format           = "CSV"
    input_compression_type = "NONE"
  }

  tags = {
    Name = "time_duration"
  }
}

resource "aws_dynamodb_table" "station_trip" {
  name         = "station_trip"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "dim_year"

  attribute {
    name = "dim_year"
    type = "N"
  }

  # import table from S3
  import_table {
    s3_bucket_source {
      bucket     = aws_s3_bucket.bucket_data.id
      key_prefix = "station_trip"
    }
    input_format           = "CSV"
    input_compression_type = "NONE"
  }

  tags = {
    Name = "dynamo_station_trip"
  }
}
