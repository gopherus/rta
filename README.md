## rta - real time aggregation for golang
This library is compatible with Go 1.16+




- [Motivation](#motivation)
- [Usage](#usage) 
- [License](#license)
- [Credits and Acknowledgements](#credits-and-acknowledgements)



## Motivation

The goal of this project is to provide an efficient API to load batch based data from upstream to different data stores.

Based on benchmark testing, it will perform 40 times faster than the traditional insert method when inserting aggregated 1M+ rows to database. 

## Usage

### Collector
- Can receive raw data by any input(i.e. record interface{}) type, batch data by using internal build-in mechanism. 

- It will call loader API to upload batch data into temp tables.
```go
package collector

func (s *Service) Collect(record interface{}) error 
```
### Loader
- Can Receive batch data from Collector and write to temp tables preparing for Merger to load data to destination table.


```go
package load

func (s *Service) Load(ctx context.Context, data interface{}, batchID string) error 
```

- Use additional Journal table to track the temp tables' status.
```go
CREATE TABLE IF NOT EXISTS RTA_JN
(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
IP VARCHAR(25),
BATCH_ID  VARCHAR(225),
STATUS  INT(11),
TEMP_TABLE_NAME  VARCHAR(225),
CREATED  datetime,
UPDATED  datetime
) ENGINE=InnoDB;
```

### Merger
Can read data from temp tables generated by Loader and merge to destination tables.
```go
package merge

func (s *Service) Merge(ctx context.Context) error 
```



## License

The source code is made available under the terms of the Apache License, Version 2, as stated in the file `LICENSE`.

Individual files may be made available under their own specific license,
all compatible with Apache License, Version 2. Please see individual files for details.

## Credits and Acknowledgements

Authors:

- Adrian Witas
- Chuan Zhao
