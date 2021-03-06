#language: ru

@tree

Функционал: Проверка расчета поля Количество

Как QA аналитик я хочу
Проверить расчет поля Количество
Чтобы данные в системе были корректны 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка расчета поля количества
*Заполнение мастер данных
	И Создание контрагента
	И Создание товара
	И Заполнение шапки документа
* Заполнение табличной части	
	Когда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000100' | 'Новый товар'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '160,00'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'       | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Новый товар' | '160,00' | '2'          | '320,00' |
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '320'
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания докмента
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |		