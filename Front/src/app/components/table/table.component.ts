import { AfterViewInit, Component, ViewChild, OnInit } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { CryptosService } from 'src/app/services/cryptos.service';
import { Cryptos } from 'src/app/models/interfaces/cryptos';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss'],
})
export class TableComponent implements AfterViewInit {
  recibeUser: string = localStorage.getItem('User');

  displayedColumns: string[] = [
    'name',
    'value',
    'icon',
    'asset',
    'stock',
  ];

  dataSource: MatTableDataSource<Cryptos> = new MatTableDataSource();

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private usersService: CryptosService) {
    console.log('El componente table se ha creado');
  }

  ngOnInit(): void {
    this.usersService.getUsers().subscribe((response) => {
      this.dataSource.data = response;
    });
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
    this.applyInitialFilter();
  }

  applyInitialFilter() {
    this.filterTableName();
    this.dataSource.filter = this.recibeUser.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

   applyPersonalFilterEmail(event: Event) {
    this.filterTableEmail();
    const filterValue = (event.target as HTMLInputElement).value;

    if (filterValue.trim() == '') {
      this.applyInitialFilter();
    } else {
      this.dataSource.filter = filterValue.trim().toLowerCase();

      if (this.dataSource.paginator) {
        this.dataSource.paginator.firstPage();
      }
    }
  }

filterTableEmail() {
    this.dataSource.filterPredicate = (
      data: Cryptos,
      filter: string
    ): boolean => {
      return data.asset.toLocaleLowerCase().includes(filter);
    };
  }

  filterTableName() {
    this.dataSource.filterPredicate = (
      data: Cryptos,
      filter: string
    ): boolean => {
      return data.name.toLocaleLowerCase().includes(filter);
    };
  }

  logout() {
    localStorage.removeItem("User");
  }
}
