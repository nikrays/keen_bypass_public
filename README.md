# ✨ Keen Bypass

[📢 Публичная Группа Telegram](https://t.me/keenetic_boost)

## 📋 Краткое описание

#### Проект предназначен для установки и настройки фильтрации интернет-трафика через репозиторий Zapret. Он загружает и обновляет необходимые правила блокировки.  
#### Также он включает функции автоматического подбора стратегий для выбранных доменов.

---

## 🎥 Demo

![Keen Bypass](https://github.com/user-attachments/assets/b58835a5-e53a-47b1-ab7d-606ca79e2204)
)

---

## ⚙️ Подготовка

> **Все условия обязательны!**  
> Если у вас была установлена старая версия, потребуется очистить корневой каталог.

- Если у вас до этого был установлен Zapret, то отформатируйте раздел EXT4 командой ниже:
  ```shell
  rm -rf /opt/*
  ```
- Отключите IPv6 только в разделе настроек для провайдера.
- Версия Keenetic OS должна быть не ниже 4.2.
- В разделе "Интернет-фильтры" отключить все сторонние фильтры (NextDNS, SkyDNS, Яндекс DNS и другие).
- В настройках Ethernet поставить галочки "Игнорировать DNSv4 и DNSv6 интернет-провайдера".
- Необходимо настроить DоT вне зависимости от провайдера, согласно инструкции [Прокси-серверы DNS-over-TLS и DNS-over-HTTPS](https://help.keenetic.com/hc/ru/articles/360021214160).

<details>
  <summary>🖼️ Пример настройки DNS</summary>

- DoT1:
  ```
  ams01.dnscry.pt
  ```
- DoT2:
  ```
  77.88.8.8
  ```
  ```
  common.dot.dns.yandex.net
  ```
- Еще один эффективный вариант — использовать ресолвер от yandex 77.88.8.88 на нестандартном порту 1253.

![DNS](https://github.com/user-attachments/assets/845fa467-1292-4b18-8a0f-12d96ccb3969)
)

</details>

---

- [Установка системы пакетов репозитория Entware на USB-накопитель (официально)](https://help.keenetic.com/hc/ru/articles/360021214160).

<details>
  <summary>📝 Короткая инструкция от себя</summary>

1. Подключить флэш накопитель к ПК и подготовить его разделы. Для работы менеджера пакетов OPKG диск должен быть с EXT4.
2. В компонентах операционной системы спуститься в самый низ до раздела "Пакеты OPKG" и поставить везде галочки.
3. Теперь нужно установить репозиторий системы пакетов Entware.
4. Например, скачали [mipsel-installer.tar.gz](https://bin.entware.net/mipselsf-k3.4/installer/mipsel-installer.tar.gz).
5. Подключите подготовленный накопитель c файловой системой EXT4 к USB-порту роутера. Диск должен отобразиться.
6. Нажмите на флэшку и в корневом каталоге OPKG создайте директорию install, куда положите файл [mipsel-installer.tar.gz](https://bin.entware.net/mipselsf-k3.4/installer/mipsel-installer.tar.gz).
7. Перейдите на страницу OPKG для выбора накопителя и нажмите "Применить". Идем в раздел диагностика, открываем Telnet/SSH.
8. Скачайте [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) для работы с SSH и Telnet. Запустите и выберите тип протокола.
9. Если видите это — подготовка завершена.

</details>

---

- Проверьте, что установлены все пакеты под категорией OPKG в наборах компонентов в настройках, а также протоколы.

<details>
  <summary>📸 Пример настроек OPKG</summary>

![OPKG](https://github.com/user-attachments/assets/59ffcf54-b403-440f-92d0-be0bed1ce39d)

- Проверьте наличие галочки "Протокол IPV6":

</details>

---

**!!! Если хотя бы одно обязательное условие не выполнено — мне не пишите !!!**

<details>
  <summary>🛡️ Blockcheck</summary>

- Сделайте тест blockcheck на ПК, предварительно выключив все сервисы (VPN, proxy, DPI bypass), которые обходят блокировки.

<details>
  <summary>📄 Короткая инструкция</summary>

1. Запустить:

2. Вставить:
   - Сначала отдельно прогоняем для YouTube:
     ```bash
     rr1---sn-ntq7ynle.googlevideo.com rr3---sn-n8v7kn7k.googlevideo.com
     ```
   - Затем для всего остального, если потребуется:
     ```bash
     rutor.info rutracker.org instagram.com static.cdninstagram.com scontent-hel3-1.cdninstagram.com facebook.com static.xx.fbcdn.net scontent-hel3-1.xx.fbcdn.net x.com api.x.com
     ```
   - Или всё вместе (очень долго — лучше на ночь):
     ```bash
     rr1---sn-ntq7ynle.googlevideo.com rr3---sn-n8v7kn7k.googlevideo.com rutor.info rutracker.org instagram.com static.cdninstagram.com scontent-hel3-1.cdninstagram.com facebook.com static.xx.fbcdn.ne...
     ```

3. Отвечать в такой последовательности:  
   - 4 или 6 или 46 — решать вам, это означает по каким протоколам ip искать, зачастую "4"  
   - у 4 раза  
   - ENTER 3 раза  
   - Запустится тест, файл которого нужно будет скинуть мне в личку.

</details>
</details>

---

### Можно приступать к установке коммерческого проекта на базе Zapret, с тонкой настройкой под вашу ситуацию.

---

### Решение некоторых ситуаций...

- Если ваше устройство поддерживает аппаратное ускорение (flow offloading, hardware nat, hardware acceleration), то iptables могут не работать корректно.
- На Keenetic можно попробовать выключить или наоборот включить сетевой ускоритель.
- Возможно, стоит выключить службу классификации трафика IntelliQOS.
- Можно попробовать отключить IPv6 на сетевом интерфейсе провайдера через веб-интерфейс маршрутизатора.
- Можно попробовать запретить весь UDP трафик на 443 порт для отключения QUIC:
  ```
  Межсетевой экран → Домашняя сеть → Добавить правило
  Включить правило: Включено
  Описание: Блокировать QUIC
  Действие: Запретить
  Протокол: UDP
  Номер порта назначения: Равен 443
  Остальные параметры оставляем без изменений
  ```

---

## 🛠️ Полезные команды

#### Перезагрузить Entware:
```shell
/opt/etc/init.d/rc.unslung restart
```

#### Запустить Zapret:
```shell
/opt/zapret/init.d/sysv/zapret start
```

#### Перезагрузить Zapret:
```shell
/opt/zapret/init.d/sysv/zapret restart
```

#### Остановить Zapret:
```shell
/opt/zapret/init.d/sysv/zapret stop
```

#### Для форматирования раздела OPKG:
```shell
rm -rf /opt/*
```

#### Удалить zapret:
```shell
rm -rf /opt/zapret/
```

#### Чтобы восстановить backup entware (openwrt) с Zapret, достаточно снова создать папку install и загрузить в нее ранее созданный backup:
```shell
/opt/etc/init.d/rc.unslung
```

---

## 🚀 Дополнительные команды

#### Запустить тест скорости Youtube:
```shell
curl --connect-to ::speedtest.selectel.ru https://manifest.googlevideo.com/100MB -k -o/dev/null
```

#### Проверить ресурс:
```shell
curl https://play.google.com -I
curl -v --http3-only https://rr3---sn-n8v7zns6.googlevideo.com
```

#### Вывод интерфейсов:
```shell
ifconfig
```

#### Blockcheck:
```shell
opkg install nmap ncat && /opt/zapret/init.d/sysv/zapret stop && SKIP_TPWS=1 MAX_TTL=-1 /opt/zapret/blockcheck.sh | tee /opt/zapret/blockcheck_out.txt
```

#### Обход геоблока через hosts Keenetic/Netcraze для таких ресурсов как:  
*ChatGPT, Gemini, Copilot, Codeium, JetBrains, Tidal, claude.ai, Canva, Intel:*
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nikrays/keen_bypass_public/main/keen_bypass_geo.sh)" 
```

---

## 💬 Обратная связь

Если возникли вопросы, присоединяйтесь к [группе Telegram](https://t.me/keenetic_boost).
