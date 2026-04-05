# ✨ Keen Bypass

[📢 **Публичная группа Telegram**](https://t.me/keenetic_boost)  

---

## 📋 О проекте

Проект предназначен для автоматической установки и настройки фильтрации интернет-трафика.
- Загружает и обновляет необходимые правила.
- Способствует ускорению досупа к некоторым ресурсам.

---

## ⚙️ Подготовка

> **Все условия обязательны!**
> Если у вас была установлена старая версия, потребуется очистить корневой каталог.

- 🔥 Выполните:
  ```shell
  rm -rf /opt/*
  ```
- 💿 Keenetic OS версии **не ниже 4.2**
- 🛡️ В "Интернет-фильтры" отключите все сторонние фильтры (NextDNS, SkyDNS, Яндекс DNS и др.)
- ⚡ Настройте DоT по [инструкции](https://help.keenetic.com/hc/ru/articles/360007687159-%D0%9F%D1%80%D0%BE%D0%BA%D1%81%D0%B8-%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D1%8B-DNS-over-TLS-%D0%B8-DNS-over-HTTPS-%D0%B4%D0%BB%D1%8F-%D1%88%D0%B8%D1%84%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F-DNS-%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81%D0%BE%D0%B2)

---

<details>
  <summary>📸 Необходимые компоненты: "Меню > Параметры системы > Изменить набор компонентов"</summary>
  
- **Компонены операционной системы:** "Рекомендованный набор"
- **Базовые компоненты:** Сервер SSH
- **Сетевые функции:** SSTP VPN-сервер, IPv6, WireGuard VPN
- **Пакеты OPKG:** Поддержка открытых пакетов, Модули ядра Netfilter

_Сохраните изменения — устройство перезагрузится_
</details>

---

<details>
  <summary>🖼️ Кастомные DNS-over-TLS (Лучше только первый использовать)</summary>

- **DoT1:**
  Сервер: `hel01.dnscry.pt`  
  TLS-имя: `hel01.dnscry.pt`

- **DoT2:**
  Сервер: `common.dot.dns.yandex.net`  
  TLS-имя: `common.dot.dns.yandex.net`

</details>

---

<details>
  <summary>📝 Установка Entware</summary>

1. Предварительно отформатируйте флешку в ext4 с названием раздела `opkg` с помощью портативной программы [DiskGenius](https://download.eassos.com/DGEng6101725_x86.zip), откройте архив, запустите DiskGenius.exe.
2. Подключите к роутеру, зайдите в CLI через [192.168.1.1/a](http://192.168.1.1/a)
3. Вставьте команду для отключения OPKG:

   ```
   opkg no disk
   ```

4. Вставьте команду (выберите архитектуру, а также место, где NAND это встроенная память, FLASH на внешний носитель):

   **Arch64 (NAND):**
   ```
   opkg disk storage:/ https://bin.entware.net/aarch64-k3.10/installer/aarch64-installer.tar.gz
   ```
   **Arch64 (FLASH):**
   ```
   opkg disk opkg:/ https://bin.entware.net/aarch64-k3.10/installer/aarch64-installer.tar.gz
   ```
   **Mipsel (FLASH):**
   ```
   opkg disk opkg:/ https://bin.entware.net/mipselsf-k3.4/installer/mipsel-installer.tar.gz
   ```
   _(название раздела FLASH можно уточнить в web-интерфейсе накопителя)_
   
5. Следите за логом в разделе диагностики

- [Официальная инструкция (Необязательно)](https://help.keenetic.com/hc/ru/articles/360021214160)
</details>

---

**‼️ Если хотя бы одно обязательное условие не выполнено — не обращайтесь за поддержкой!**

---

> 🛠️ Теперь можно приступать к установке коммерческого проекта, с тонкой настройкой под вашу ситуацию.

---

### ⚠️ Решение типовых проблем

- Аппаратное ускорение (flow offloading, hardware nat) может мешать работе iptables — попробуйте выключить/включить сетевой ускоритель
- Отключите службу IntelliQOS
- Отключите IPv6 на интерфейсе провайдера через веб-интерфейс
- Заблокировать QUIC:
  ```
  Межсетевой экран → Домашняя сеть → Добавить правило
  Включить правило: Включено
  Описание: Блокировать QUIC
  Действие: Запретить
  Протокол: UDP
  Номер порта назначения: 443
  ```

---

## 🛠️ Полезные команды

- 🧹 Форматирование раздела OPKG:
  ```shell
  rm -rf /opt/*
  ```
- 💾 Сделать backup entware настроек только для текущего устройства:
  ```shell
  cd /opt && tar cvzf /opt/backup-$(date -I).tar.gz *
  ```
- 🔙 Скрипт init.rc:
  ```shell
  /opt/etc/init.d/rc.unslung
  ```
- ⏹️ Остановить Entware:
  ```shell
  /opt/etc/init.d/rc.unslung stop
  ```
- 🚦 Запустить Entware:
  ```shell
  /opt/etc/init.d/rc.unslung start
  ```
- 🔁 Перезагрузить Entware:
  ```shell
  /opt/etc/init.d/rc.unslung restart
  ```
- ⏹️ Остановить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret stop
  ```
- 🚦 Запустить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret start
  ```
- 🔁 Перезагрузить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret restart
  ```
- 🗑️ Удалить службу:
  ```shell
  rm -rf /opt/zapret/
  ```

---

## 🚀 Дополнительные команды

- 🏎️ Тест скорости:
  ```shell
  curl --tls-max 1.2 -4 -o /dev/null -k --connect-to ::speedtest.selectel.ru --max-time 5 https://test.googlevideo.com/10MB -w "%{speed_download}" | awk '{printf "%.2f Mbps\n", $1*8/1000000}'
  ```
- 🔍 Проверить ресурс:
  ```shell
  curl https://play.google.com -I
  curl -v --tls-max 1.2 --tlsv1.2 https://rr3---sn-n8v7kn7k.googlevideo.com -4
  curl -v --http3-only https://rr3---sn-n8v7zns6.googlevideo.com -4
  curl -v --tls-max 1.2 --tlsv1.2 https://rr3---sn-n8v7kn7k.googlevideo.com -6
  curl -v --http3-only https://rr3---sn-n8v7kn7k.googlevideo.com -6
  ```
- 🖥️ Вывод интерфейсов:
  ```shell
  ifconfig
  ```

---

## 💬 Обратная связь

Возникли вопросы? Присоединяйтесь к [группе Telegram](https://t.me/keenetic_boost) 🚀

---
