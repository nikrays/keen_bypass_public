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
- 🖥️ В настройках Ethernet — "Игнорировать DNSv4 и DNSv6 интернет-провайдера"
- ⚡ Настройте DоT по [инструкции](https://help.keenetic.com/hc/ru/articles/360021214160)

<details>
  <summary>🖼️ Кастомные DNS-over-TLS</summary>

- **DoT1:**
  Сервер: `tuu01.dnscry.pt`  
  TLS-имя: `tuu01.dnscry.pt`

- **DoT1(Альтернатива1):**
  Сервер: `hel01.dnscry.pt`  
  TLS-имя: `hel01.dnscry.pt`

- **DoT1(Альтернатива2):**
  Сервер: `gru01.dnscry.pt`  
  TLS-имя: `gru01.dnscry.pt`

- **DoT2:**
  Сервер: `77.88.8.8`  
  TLS-имя: `common.dot.dns.yandex.net`

</details>

---

<details>
  <summary>📝 Установка Entware</summary>

1. Предварительно отформатируйте флешку в ext4 с названием раздела `opkg`
2. Подключите к роутеру, зайдите в CLI через [192.168.1.1/a](http://192.168.1.1/a)
3. Вставьте команду для отключения OPKG:

   ```
   opkg no disk
   ```

4. Вставьте команду (выберите архитектуру):

   **Mipsel:**
   ```
   opkg disk opkg:/ https://bin.entware.net/mipselsf-k3.4/installer/mipsel-installer.tar.gz
   ```
   **Arch64:**
   ```
   opkg disk opkg:/ https://bin.entware.net/aarch64-k3.10/installer/aarch64-installer.tar.gz
   ```
   _(название раздела можно уточнить в web-интерфейсе накопителя)_

5. Следите за логом в разделе диагностики

- [Официальная инструкция](https://help.keenetic.com/hc/ru/articles/360021214160)
</details>

---

<details>
  <summary>📸 Необходимые компоненты: "Меню > Параметры системы > Изменить набор компонентов"</summary>

- **Базовые компоненты:** Сервер SSH
- **Сетевые функции:** SSTP VPN-сервер, IPv6, WireGuard VPN
- **Пакеты OPKG:** Поддержка открытых пакетов, Модули ядра Netfilter

_Сохраните изменения — устройство перезагрузится_
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

- 🔄 Перезагрузить Entware:
  ```shell
  /opt/etc/init.d/rc.unslung restart
  ```
- 🚦 Запустить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret start
  ```
- 🔁 Перезагрузить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret restart
  ```
- ⏹️ Остановить службу:
  ```shell
  /opt/zapret/init.d/sysv/zapret stop
  ```
- 💾 Сделать backup entware настроек только для текущего устройства:
  ```shell
  cd /opt && tar cvzf /opt/backup-$(date -I).tar.gz *
  ```
- 🧹 Форматирование раздела OPKG:
  ```shell
  rm -rf /opt/*
  ```
- 🗑️ Удалить службу:
  ```shell
  rm -rf /opt/zapret/
  ```
- 🔙 Скрипт init.rc:
  ```shell
  /opt/etc/init.d/rc.unslung
  ```

---

## 🚀 Дополнительные команды

- 🏎️ Тест скорости:
  ```shell
  curl --connect-to ::speedtest.selectel.ru https://manifest.googlevideo.com/10MB -k -o/dev/null
  ```
- 🔍 Проверить ресурс:
  ```shell
  curl https://play.google.com -I
  curl -v --tls-max 1.2 --tlsv1.2 https://rr3---sn-n8v7kn7k.googlevideo.com -4
  curl -v --http3-only https://rr3---sn-n8v7zns6.googlevideo.com
  curl -v --tls-max 1.2 --tlsv1.2 https://rr3---sn-n8v7kn7k.googlevideo.com -6
  curl -v --http3-only https://rr3---sn-n8v7kn7k.googlevideo.com -6
  ```
- 🖥️ Вывод интерфейсов:
  ```shell
  ifconfig
  ```
- 🕵️ Blockcheck:
  ```shell
  opkg install nmap ncat && /opt/zapret/init.d/sysv/zapret stop && SKIP_TPWS=1 /opt/zapret/blockcheck.sh | tee /opt/zapret/blockcheck_out.txt
  ```
- 🌍 Обход геоблока через hosts Keenetic/Netcraze (ChatGPT, Gemini, Copilot, Codeium, JetBrains, Tidal, claude.ai, Canva, Intel):
  ```shell
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/nikrays/keen_bypass_public/main/keen_bypass_geo.sh)"
  ```

---

## 💬 Обратная связь

Возникли вопросы? Присоединяйтесь к [группе Telegram](https://t.me/keenetic_boost) 🚀

---
