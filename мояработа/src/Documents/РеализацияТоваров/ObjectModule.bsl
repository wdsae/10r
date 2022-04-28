Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр ОстаткиТоваров
	Перем ДанныеЗаполнения;
	Движения.ОстаткиТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаТовары из Товары Цикл
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.Период = Дата;
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Количество = ТекСтрокаТовары.Количество;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ

//Процедура ОбработкаЗаполнения(ДанныеЗаполнения,СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	//@skip-warning
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПоступлениеТоваров") Тогда
		// Заполнение шапки
		Контрагент = ДанныеЗаполнения.Контрагент;
		Ответственный = ДанныеЗаполнения.Ответственный;

		Для Каждого ТекСтрокаТовары из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Цена = ТекСтрокаТовары.Цена;
			НоваяСтрока.Сумма = ТекСтрокаТовары.Сумма;
		КонецЦикла;
	КонецЕсли;

	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ

КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	СуммаДокумента = Товары.Итог("Сумма");
КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	
	//@skip-warning
	Если НЕ Контрагент.ЭтоКлиент = Ложь Тогда
		Отказ = Истина;
		Сообщить("В документе должен быть выбран ЭтоКлиент")
	КонецЕсли;
	КонецПроцедуры;