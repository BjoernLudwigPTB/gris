CREATE TABLE IF NOT EXISTS `gris_abstracts` (
  `gris_abstracts_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_resource_id` bigint(20) unsigned NOT NULL,
  `gris_abstracts_text` text NOT NULL,
  `gris_abstracts_language` varchar(5) NOT NULL,
  PRIMARY KEY (`gris_abstracts_id`),
  KEY `gris_resource_id` (`gris_resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_address` (
  `gris_address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_city_id` bigint(20) unsigned DEFAULT NULL,
  `gris_address_street` varchar(255) DEFAULT NULL,
  `gris_address_streetnumber` varchar(255) DEFAULT NULL,
  `gris_clean` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`gris_address_id`),
  KEY `gris_city_id` (`gris_city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_address` (`gris_address_id`, `gris_city_id`, `gris_address_street`, `gris_address_streetnumber`, `gris_clean`) VALUES
(1, 1, 'Unter Sachsenhausen', '6-8', 1),
(2, 2, 'B2', '1', 1),
(3, 2, 'B2', '2', 1),
(5, 2, 'B2', '5', 1),
(6, 2, 'B2', '8', 1),
(7, 2, 'B2', '13', 1),
(8, 2, 'B2', '14', 1),
(9, 2, 'B2', '15', 1),
(10, 2, 'M1', '1', 1),
(11, 2, 'M1', '10', 1),
(12, 2, 'L13', '9', 1);


CREATE TABLE IF NOT EXISTS `gris_changelog` (
  `gris_changelog_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_changelog_entity_id` bigint(20) unsigned NOT NULL,
  `gris_changelog_date` datetime NOT NULL,
  `gris_changelog_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`gris_changelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_city` (
  `gris_city_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_city_name` varchar(255) NOT NULL,
  `gris_city_postalcode` varchar(10) DEFAULT NULL,
  `gris_city_areacode` varchar(10) DEFAULT NULL,
  `gris_city_countrycode` varchar(5) DEFAULT NULL,
  `gris_city_country` varchar(255) DEFAULT NULL,
  `gris_clean` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`gris_city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_city` (`gris_city_id`, `gris_city_name`, `gris_city_postalcode`, `gris_city_areacode`, `gris_city_countrycode`, `gris_city_country`, `gris_clean`) VALUES
(1, 'Köln', '50667', '0221', '49', NULL, 1),
(2, 'Mannheim', '68159', '0621', '49', NULL, 1);



CREATE TABLE IF NOT EXISTS `gris_event` (
  `gris_event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_resource_id` bigint(20) unsigned DEFAULT NULL,
  `gris_event_title` text,
  `gris_event_start` datetime DEFAULT NULL,
  `gris_event_end` datetime DEFAULT NULL,
  `gris_event_ects` tinyint(2) DEFAULT NULL,
  `gris_event_duration` varchar(255) DEFAULT NULL,
  `gris_event_invited` tinyint(1) DEFAULT '0',
  `gris_event_keynote` tinyint(1) DEFAULT '0',
  `gris_event_international` tinyint(1) DEFAULT '0',
  `gris_event_semester` varchar(255) DEFAULT NULL,
  `gris_event_university` text,
  `gris_city_id` bigint(20) unsigned DEFAULT NULL,
  `3p_event_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_event_id`),
  KEY `gris_resource_id` (`gris_resource_id`),
  KEY `gris_city_id` (`gris_city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_generic_data` (
  `gris_generic_data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_institute_id` bigint(20) unsigned DEFAULT NULL,
  `gris_generic_data_name` varchar(255) NOT NULL,
  `gris_generic_data_email` varchar(255) NOT NULL,
  `gris_generic_data_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_generic_data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_groups` (
  `gris_groups_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gris_groups_name` varchar(255) DEFAULT NULL,
  `gris_groups_is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`gris_groups_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_groups` (`gris_groups_id`, `gris_groups_name`, `gris_groups_is_admin`) VALUES
(1, 'Bibliothek', 0),
(2, 'Qualitätsmanagement', 0),
(3, 'Benutzer', 0);


CREATE TABLE IF NOT EXISTS `gris_identifier` (
  `gris_identifier_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_resource_id` bigint(20) unsigned NOT NULL,
  `gris_identifier_type` varchar(255) NOT NULL,
  `gris_identifier_value` text NOT NULL,
  PRIMARY KEY (`gris_identifier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_institute` (
  `gris_institute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_institute_phone` varchar(255) DEFAULT NULL,
  `gris_address_id` bigint(20) unsigned DEFAULT NULL,
  `gris_institute_name` varchar(255) NOT NULL,
  `gris_institute_url` varchar(255) DEFAULT NULL,
  `gris_institute_internal` tinyint(1) DEFAULT NULL,
  `gris_clean` tinyint(1) DEFAULT NULL,
  `gris_institute_fax` varchar(255) DEFAULT NULL,
  `gris_institute_basephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_institute_id`),
  KEY `gris_address_id` (`gris_address_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_institute` (`gris_institute_id`, `gris_institute_phone`, `gris_address_id`, `gris_institute_name`, `gris_institute_url`, `gris_institute_internal`, `gris_clean`, `gris_institute_fax`, `gris_institute_basephone`) VALUES
(1, '47694', 1, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '199', '0'),
(2, '1246', 2, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(3, '1246', 3, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(4, '1246', 4, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(5, '1246', 5, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(6, '1246', 6, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(7, '1246', 7, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(8, '1246', 8, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(9, '1246', 9, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(10, '1246', 10, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(11, '1246', 11, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0'),
(12, '1246', 12, 'GESIS - Leibniz-Institut für Sozialwissenschaften', 'http://www.gesis.org', 1, 1, '100', '0');

CREATE TABLE IF NOT EXISTS `gris_journal` (
  `gris_journal_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_journal_name` varchar(255) NOT NULL,
  `gris_journal_index_wos` smallint(4) unsigned DEFAULT NULL,
  `gris_journal_index_csa` smallint(4) unsigned DEFAULT NULL,
  `gris_journal_index_scopus` smallint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_journal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_organigram` (
  `gris_person_id` bigint(20) unsigned NOT NULL,
  `gris_unit_id` bigint(20) unsigned NOT NULL,
  `gris_organigram_role` varchar(255) NOT NULL DEFAULT 'Mitarbeiter',
  `gris_organigram_start` datetime DEFAULT NULL,
  `gris_organigram_end` datetime DEFAULT NULL,
  PRIMARY KEY (`gris_person_id`,`gris_unit_id`),
  KEY `gris_person_id` (`gris_person_id`,`gris_unit_id`),
  KEY `gris_unit_id` (`gris_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gris_permissions` (
  `gris_permissions_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_groups_id` bigint(20) unsigned DEFAULT NULL,
  `gris_permissions_action` varchar(255) DEFAULT NULL,
  `gris_permissions_param_01` bigint(20) unsigned DEFAULT NULL,
  `gris_permissions_param_02` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_permissions_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_permissions` (`gris_permissions_id`, `gris_groups_id`, `gris_permissions_action`, `gris_permissions_param_01`, `gris_permissions_param_02`) VALUES
(1, 1, 'show_page', 0, NULL),
(2, 1, 'show_page', 1, NULL),
(3, 1, 'show_page', 3, NULL),
(4, 1, 'show_page', 7, NULL),
(5, 1, 'show_page', 9, NULL),
(8, 3, 'show_page', 0, NULL),
(9, 3, 'show_page', 1, NULL),
(10, 3, 'show_page', 7, NULL),
(11, 1, 'show_page', 8, NULL),
(12, 1, 'change_workflow', 1, 2),
(13, 1, 'change_workflow', 3, 2),
(14, 1, 'change_workflow', 0, 2),
(15, 3, 'change_workflow', 0, 3),
(16, 1, 'change_workflow', 0, 3),
(17, 1, 'change_workflow', 2, 3);

CREATE TABLE IF NOT EXISTS `gris_person` (
  `gris_person_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_institute_id` bigint(20) unsigned NOT NULL,
  `gris_person_is_student` tinyint(1) NOT NULL DEFAULT '0',
  `gris_person_is_alumni` tinyint(1) NOT NULL DEFAULT '0',
  `gris_person_room` varchar(255) DEFAULT NULL,
  `gris_person_phone` varchar(255) DEFAULT NULL,
  `gris_person_fax` varchar(255) DEFAULT NULL,
  `gris_person_gender` varchar(32) DEFAULT NULL,
  `gris_person_url` varchar(255) DEFAULT NULL,
  `gris_person_cv` varchar(255) DEFAULT NULL,
  `gris_person_graduate_area` varchar(255) DEFAULT NULL,
  `gris_person_show` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`gris_person_id`),
  KEY `gris_institute_id` (`gris_institute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_personname` (
  `gris_personname_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_person_id` bigint(20) unsigned DEFAULT NULL,
  `gris_personname_name` varchar(255) NOT NULL,
  `gris_personname_firstname` varchar(255) NOT NULL,
  `gris_personname_email` varchar(255) DEFAULT NULL,
  `gris_personname_order` tinyint(4) DEFAULT NULL,
  `gris_personname_title_before` varchar(255) DEFAULT NULL,
  `gris_personname_title_after` varchar(255) DEFAULT NULL,
  `gris_personname_external` tinyint(1) DEFAULT NULL,
  `3p_person_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_personname_id`),
  KEY `gris_person_id` (`gris_person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_persontext` (
  `gris_persontext_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_person_id` bigint(20) unsigned NOT NULL,
  `gris_persontext_text` mediumtext NOT NULL,
  `gris_persontext_type` varchar(255) NOT NULL,
  `gris_persontext_language` varchar(5) NOT NULL,
  PRIMARY KEY (`gris_persontext_id`),
  KEY `gris_person_id` (`gris_person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_project` (
  `gris_project_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_project_show` tinyint(1) unsigned DEFAULT NULL,
  `gris_project_type` varchar(255) DEFAULT NULL,
  `gris_project_title` text NOT NULL,
  `gris_project_subtitle` text,
  `gris_project_acronym` varchar(25) DEFAULT NULL,
  `gris_project_contact_id` bigint(20) unsigned DEFAULT NULL,
  `gris_project_generic_contact` text,
  `gris_project_description` text,
  `gris_project_start` date DEFAULT NULL,
  `gris_project_end` date DEFAULT NULL,
  PRIMARY KEY (`gris_project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_project_relations` (
  `gris_project_relations_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_project_relations_subject_id` bigint(20) NOT NULL,
  `gris_project_relations_role` varchar(255) DEFAULT NULL,
  `gris_project_relations_object_id` bigint(20) NOT NULL,
  `gris_project_relations_order` tinyint(255) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_project_relations_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_publication` (
  `gris_publication_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_journal_id` bigint(20) unsigned DEFAULT NULL,
  `gris_publisher_id` bigint(20) unsigned DEFAULT NULL,
  `gris_resource_id` bigint(20) unsigned NOT NULL,
  `gris_publication_subtype` varchar(255) DEFAULT NULL,
  `gris_publication_online` tinyint(1) DEFAULT NULL,
  `gris_publication_collection` text,
  `gris_publication_edition` varchar(255) DEFAULT NULL,
  `gris_publication_series` varchar(255) DEFAULT NULL,
  `gris_publication_volume` varchar(255) DEFAULT NULL,
  `gris_publication_referred` tinyint(1) DEFAULT NULL,
  `gris_publication_index` varchar(255) DEFAULT NULL,
  `gris_publication_issue` varchar(255) DEFAULT NULL,
  `gris_publication_pages` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_publication_id`),
  KEY `gris_journal_id` (`gris_journal_id`,`gris_publisher_id`,`gris_resource_id`),
  KEY `gris_publisher_id` (`gris_publisher_id`),
  KEY `gris_resource_id` (`gris_resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_publication_institutes` (
  `gris_publication_institutes_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_publication_id` bigint(20) unsigned NOT NULL,
  `gris_institute_id` bigint(20) unsigned NOT NULL,
  `gris_publication_institutes_order` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_publication_institutes_id`),
  KEY `gris_publiaction_id` (`gris_publication_id`),
  KEY `gris_institute_id` (`gris_institute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_publisher` (
  `gris_publisher_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_city_id` bigint(20) unsigned DEFAULT NULL,
  `gris_publisher_name` varchar(255) NOT NULL,
  PRIMARY KEY (`gris_publisher_id`),
  KEY `gris_address_id` (`gris_city_id`),
  KEY `gris_publisher_name` (`gris_publisher_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_resource` (
  `gris_resource_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_resourcetype_id` bigint(20) unsigned NOT NULL,
  `gris_resource_year` int(4) NOT NULL,
  `gris_resource_appears` tinyint(1) DEFAULT NULL,
  `gris_resource_title` text NOT NULL,
  `gris_resource_subtitle` varchar(255) DEFAULT NULL,
  `gris_resource_subtitle_2` varchar(255) DEFAULT NULL,
  `gris_resource_count` smallint(5) unsigned NOT NULL DEFAULT '1',
  `gris_resource_country` varchar(255) DEFAULT NULL,
  `gris_workflow_id` bigint(20) unsigned DEFAULT NULL,
  `gris_workflow_step_order` smallint(6) unsigned DEFAULT NULL,
  `gris_resource_show` tinyint(1) DEFAULT NULL,
  `gris_resource_time_create` datetime DEFAULT NULL,
  `gris_resource_time_change` datetime DEFAULT NULL,
  `gris_resource_oa_upload` bigint(20) unsigned DEFAULT NULL,
  `gris_resource_last_person` bigint(20) unsigned DEFAULT NULL,
  `3p_resource_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_resource_id`),
  KEY `gris_resourcetype_id` (`gris_resourcetype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_resourcetype` (
  `gris_resourcetype_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_resourcetype_name` varchar(255) NOT NULL,
  `gris_resourcetype_group` varchar(255) DEFAULT NULL,
  `gris_resourcetype_workflow` varchar(255) DEFAULT NULL,
  `gris_resourcetype_tables` varchar(255) DEFAULT NULL,
  `gris_resourcetype_order` int(10) unsigned NOT NULL DEFAULT '0',
  `gris_resourcetype_default_show` smallint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_resourcetype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_resourcetype` (`gris_resourcetype_id`, `gris_resourcetype_name`, `gris_resourcetype_group`, `gris_resourcetype_workflow`, `gris_resourcetype_tables`, `gris_resourcetype_order`, `gris_resourcetype_default_show`) VALUES
(1, 'Bibliographie', 'Publikation', NULL, NULL, 6, 1),
(2, 'Arbeits- und Diskussionspapier', 'Publikation', NULL, NULL, 5, 1),
(4, 'Monographie', 'Publikation', NULL, NULL, 1, 1),
(5, 'Gutachten', 'Gutachten', NULL, NULL, 11, NULL),
(6, 'Sonstiges', 'Sonstiges', NULL, NULL, 18, NULL),
(8, 'Herausgeberschaft', 'Publikation', NULL, NULL, 2, 1),
(9, 'Beitrag im Sammelwerk', 'Publikation', NULL, NULL, 4, 1),
(10, 'Sonstiger Artikel', 'Publikation', NULL, NULL, 7, NULL),
(11, 'Zeitschriftenaufsatz', 'Publikation', NULL, NULL, 3, 1),
(12, 'Kolloquium', 'Lehre', NULL, 'event', 15, NULL),
(13, 'Veranstaltung', 'Organisation', NULL, 'event', 17, NULL),
(15, 'Seminar', 'Lehre', NULL, 'event', 13, NULL),
(17, 'Sonstiges', 'Lehre', NULL, 'event', 16, NULL),
(18, 'Übung', 'Lehre', NULL, 'event', 14, NULL),
(19, 'Vorlesung', 'Lehre', NULL, 'event', 12, NULL),
(20, 'Konferenzbeitrag', 'Vortrag', NULL, 'event', 9, 1),
(29, 'Beitrag nicht auf Konferenz', 'Vortrag', NULL, 'event', 10, NULL),
(30, 'Variable Report', 'Publikation', NULL, NULL, 8, NULL);

CREATE TABLE IF NOT EXISTS `gris_resource_persons` (
  `gris_personname_id` bigint(20) unsigned NOT NULL,
  `gris_resource_persons_role` varchar(255) NOT NULL,
  `gris_resource_persons_order` tinyint(255) DEFAULT NULL,
  `gris_resource_show` tinyint(1) DEFAULT NULL,
  `gris_resource_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`gris_personname_id`,`gris_resource_persons_role`,`gris_resource_id`),
  KEY `gris_personname_id` (`gris_personname_id`,`gris_resource_id`),
  KEY `gris_resource_id` (`gris_resource_id`),
  KEY `gris_resource_persons_order` (`gris_resource_persons_order`),
  KEY `gris_resource_persons_role` (`gris_resource_persons_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `gris_settings` (
  `gris_settings_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_settings_key` varchar(32) NOT NULL,
  `gris_settings_value` varchar(255) NOT NULL,
  `gris_settings_group` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`gris_settings_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_settings` (`gris_settings_id`, `gris_settings_key`, `gris_settings_value`, `gris_settings_group`) VALUES
(1, 'gender', 'n', 'default'),
(2, 'italics', 'em', 'default'),
(3, 'mail_domain', 'gesis.org', 'default'),
(4, 'name_separator', ',', 'default'),
(5, 'rootline_separator', ' -> ', 'layout'),
(6, 'title', 'Research Information System', 'page'),
(7, 'session_variable', 'gris_auth', 'auth'),
(8, 'session_user', 'gris_user', 'auth'),
(9, 'session_lifetime', '3600', 'auth'),
(10, 'default_group', '3', 'auth'),
(11, 'ldaphost', '127.0.0.1', 'ldap'),
(12, 'basedn', 'OU=kommunikation,DC=nodomain', 'ldap'),
(13, 'ldap_reader_name', 'CN=guest,DC=nodomain', 'ldap'),
(14, 'ldap_reader_pass', 'guest123', 'ldap'),
(15, 'use_data', '1', 'ldap'),
(16, 'basedata_mail', 'helpdesk@gesis.org', 'ldap'),
(17, 'method', 'POST', 'form'),
(18, 'autocomplete', 'off', 'form'),
(19, 'form_element_wrap', 'div', 'form'),
(20, 'additional_button', 'gris_additional_button', 'form'),
(21, 'validation', 'php', 'form'),
(22, 'form_class', 'ym-form ym-columnar', 'form'),
(23, 'input_wrap_class', 'ym-fbox-text', 'form'),
(24, 'button_wrap_class', 'ym-fbox-button', 'form'),
(25, 'button_submit_class', 'ym-button', 'form'),
(26, 'button_reset_class', 'ym-button', 'form'),
(27, 'select_wrap_class', 'ym-fbox-select', 'form'),
(28, 'checkbox_wrap_class', 'ym-fbox-check', 'form'),
(29, 'radio_wrap_class', 'ym-fbox-check', 'form'),
(30, 'form_element_required', '<sup class=''ym-required''>*</sup>', 'form'),
(31, 'translation_path', 'i18n', 'i18n'),
(32, 'default_language', 'de', 'i18n'),
(33, 'height', '300', 'image'),
(34, 'width', '230', 'image'),
(35, 'path', 'files/photos/', 'image'),
(36, 'quality', '90', 'image'),
(37, 'path', 'files/pdf/', 'pdf'),
(38, 'path', 'files/fulltext/', 'fulltext'),
(39, 'default_suffix', 'pdf', 'fulltext'),
(40, 'path', 'templates/', 'template'),
(41, 'suffix', '.tpl', 'template'),
(42, 'citation_style', 'chicago', 'publication'),
(43, 'begin', '1900', 'lists'),
(44, 'end', '2050', 'lists'),
(45, 'default_style', 'chicago', 'cite'),
(46, 'default_export_style', 'bibtex', 'cite'),
(47, 'default_workflow', '1', 'publication'),
(48, 'default_workflow_step', '1', 'publication'),
(49, 'mannheim_default_address_id', '2', 'default'),
(50, 'additional_small_button', 'gris_additional_small_button', 'form'),
(51, 'pagebrowser_range', '2', 'template'),
(52, 'temp_dir', 'temp/', 'default'),
(53, 'temp_filename', 'gris_statistics.html', 'default'),
(54, 'gallery_path', 'files/photos/gallery/', 'image'),
(55, 'teams', '1', 'statistics'),
(56, 'ldap_filter', 'Deaktiviert', 'ldap'),
(57, 'sn', 'sn', 'ldap'),
(58, 'givenname', 'givenname', 'ldap'),
(59, 'distinguishedname', 'dn', 'ldap'),
(60, 'objectguid', 'entryuuid', 'ldap'),
(61, 'mail', 'mail', 'ldap'),
(62, 'postalcode', 'postalcode', 'ldap'),
(63, 'streetaddress', 'street', 'ldap'),
(64, 'telephonenumber', 'telephonenumber', 'ldap'),
(65, 'facsimiletelephonenumber', 'facsimiletelephonenumber', 'ldap'),
(66, 'l', 'l', 'ldap'),
(67, 'physicaldeliveryofficename', 'roomnumber', 'ldap'),
(68, 'sAMAccountName', 'uid', 'ldap');

CREATE TABLE IF NOT EXISTS `gris_unit` (
  `gris_unit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_unit_name` varchar(255) NOT NULL,
  `gris_unit_acronym` varchar(255) DEFAULT NULL,
  `gris_unit_type` varchar(255) NOT NULL,
  `gris_unit_parent_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_unit` (`gris_unit_id`, `gris_unit_name`, `gris_unit_acronym`, `gris_unit_type`, `gris_unit_parent_id`) VALUES
(1, 'Präsident', NULL, 'Präsident', 0),
(2, 'Präsidialbüro', NULL, 'Präsidialbüro', 1),
(3, 'Kommunikation', NULL, 'Stabsabteilung', 1),
(4, 'Wissenstechnologien für Sozialwissenschaften', 'WTS', 'Abteilung', 1),
(5, 'Computational Social Science', 'CSS', 'Abteilung', 1),
(6, 'Survey Design and Methodology', 'SDM', 'Abteilung', 1),
(7, 'Dauerbeobachtung der Gesellschaft', 'DBG', 'Abteilung', 1),
(8, 'Datenarchiv für Sozialwissenschaften', 'DAS', 'Abteilung', 1),
(9, 'Verwaltung', NULL, '', 1),
(10, 'Informationstechnik', 'IT', '', 1),
(11, 'Wissensvermittlung', NULL, 'Stabsstelle', 1),
(12, 'Bibliothek', NULL, '', 1),
(13, 'Qualitätsmanagement', 'QM', 'Stabsstelle', 1),
(14, 'Daten-Registrierungsagentur', 'da|ra', 'Stabsstelle', 8),
(15, 'Methoden Daten Analysen', 'MDA', 'Redaktion', 1),
(16, 'Historical Social Research', 'HSR', 'Redaktion', 1),
(17, 'Nicht zugeordnet', 'Nicht zugeordnet', 'Nicht zugeordnet', NULL),
(18, 'Zentrum für Sozialindikatorenforschung', 'ZFS', 'Team', 7),
(19, 'German Microdata Lab', 'GML', 'Team', 7),
(20, 'Survey Programme', NULL, 'Team', 7),
(21, 'Sozialwissenschaftliche Metadatenstandards', NULL, 'Team', 7),
(22, 'Survey Operations', NULL, 'Team', 6),
(23, 'European Social Survey', 'ESS', 'Team', 6),
(24, 'Erhebungsmodi', NULL, 'Team', 6),
(25, 'Statistics', NULL, 'Team', 6),
(26, 'Survey Instruments', NULL, 'Team', 6),
(27, 'Cross-cultural Surveys', NULL, 'Team', 6),
(28, 'Social Analytics and Services', 'SAS', 'Team', 5),
(29, 'Knowledge Discovery', 'KD', 'Team', 5),
(30, 'Center of Excellence Women and Science', 'CEWS', 'Team', 7),
(31, 'Data Linking', NULL, 'Team', 4),
(32, 'Portale Mehrwertdienste', NULL, 'Team', 4),
(33, 'Science 2.0', NULL, 'Team', 4),
(34, 'Akquisition, Sicherung, Datenbereitstellung', NULL, 'Team', 8),
(35, 'Archivinstrumente und -prozesse', NULL, 'Team', 8),
(36, 'Internationale Dateninfrastrukturen', NULL, 'Team', 8),
(37, 'Internationale Umfragen', NULL, 'Team', 8),
(38, 'Eurolab', NULL, 'Team', 8),
(40, 'Nationale Umfrageprogramme', NULL, 'Team', 8),
(41, 'Historische Studien', NULL, 'Team', 8),
(42, 'Persönliche Referentin', NULL, 'Persönliche Referentin', 1),
(43, 'Finanzen Köln', NULL, 'Team', 9),
(44, 'Finanzen Mannheim', NULL, 'Team', 9),
(45, 'Personal / Recht Köln', NULL, 'Team', 9),
(46, 'Personal / Recht Mannheim', NULL, 'Team', 9),
(47, 'Drittmittel', NULL, 'Team', 9),
(48, 'Data Science', 'DS', 'Team', 5),
(49, 'Computergestützte Messung und Kodierung von Bildungsabschlüssen in Umfragen', 'CAMCES', 'Team', 6),
(50, 'GESIS-Architektur', NULL, 'Team', 4),
(51, 'GESIS Panel', NULL, 'Team', 6),
(52, 'Digital SSH', NULL, 'Team', 4);

CREATE TABLE IF NOT EXISTS `gris_user` (
  `gris_user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_user_ldap_username` varchar(255) NOT NULL,
  `gris_user_login_date` datetime NOT NULL,
  `gris_user_ip` varchar(15) DEFAULT NULL,
  `gris_user_logincount` int(10) unsigned NOT NULL DEFAULT '0',
  `gris_person_id` bigint(20) unsigned NOT NULL,
  `gris_user_ldap_objectguid` varchar(255) NOT NULL,
  `gris_user_ldap_sn` varchar(255) DEFAULT NULL,
  `gris_user_ldap_givenname` varchar(255) DEFAULT NULL,
  `gris_user_ldap_mail` varchar(255) NOT NULL,
  `gris_user_groups` varchar(255) DEFAULT NULL,
  `gris_user_is_admin` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_user_id`),
  KEY `gris_person_id` (`gris_person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_vocabulary` (
  `gris_vocabulary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gris_vocabulary_group` varchar(255) NOT NULL,
  `gris_vocabulary_text` varchar(255) NOT NULL,
  `gris_vocabulary_usage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gris_vocabulary_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `gris_vocabulary` (`gris_vocabulary_id`, `gris_vocabulary_group`, `gris_vocabulary_text`, `gris_vocabulary_usage`) VALUES
(1, 'gris_identifier_type', 'URL', NULL),
(2, 'gris_identifier_type', 'URN', NULL),
(3, 'gris_identifier_type', 'DOI', NULL),
(4, 'gris_identifier_type', 'ISSN', NULL),
(5, 'gris_identifier_type', 'ISBN', NULL),
(6, 'gris_persontext_type', 'Forschung', NULL),
(7, 'gris_persontext_type', 'Service', NULL),
(8, 'gris_persontext_type', 'Vita', NULL),
(9, 'gris_resource_persons_role', 'Autor', NULL),
(10, 'gris_resource_persons_role', 'Herausgeber', NULL),
(39, 'gris_unit_type', 'Präsident', NULL),
(40, 'gris_unit_type', 'Abteilung', NULL),
(41, 'gris_unit_type', 'Team', NULL),
(42, 'gris_unit_type', 'Stabsabteilung', NULL),
(43, 'gris_unit_type', 'Bereich', NULL),
(44, 'gris_unit_type', 'Präsidialbüro', NULL),
(45, 'gris_persontext_language', 'de_DE', NULL),
(46, 'gris_persontext_language', 'en_US', NULL),
(47, 'gris_persontext_type', 'Vita', NULL),
(48, 'gris_organigram_role', 'Mitarbeiter', '*|1'),
(49, 'gris_organigram_role', 'Sprecher', '12|*'),
(50, 'gris_organigram_role', 'Stellvertretender Sprecher', '12|*'),
(51, 'gris_organigram_role', 'Leiter', '*|1,2,9,12,13,15,16'),
(52, 'gris_organigram_role', 'Stellvertretender Leiter', '*|1,2,9,12,13,15,16'),
(53, 'gris_organigram_role', 'Verwaltungsdirektor', '9|*'),
(54, 'gris_organigram_role', 'Stellvertretender Verwaltungsdirektor', '9|*'),
(55, 'gris_organigram_role', 'Präsident', '1|*'),
(56, 'gris_organigram_role', 'Stellvertretender Präsident', '1|*'),
(57, 'gris_organigram_role', 'Persönlicher Referent', '2|*'),
(58, 'gris_organigram_role', 'Herausgeber', '16|*'),
(59, 'gris_organigram_role', 'Stellvertretender Herausgeber', '16|*'),
(60, 'gris_organigram_role', 'Kommissarischer Leiter', '*|1,2,9,12,13,15,16'),
(61, 'gris_organigram_role', 'Redaktionsleiter', '15|*'),
(62, 'gris_organigram_role', 'Stellvertretender Redaktionsleiter', '15|*'),
(63, 'gris_organigram_role', 'Sekretär', '2|*'),
(64, 'gris_organigram_role', 'Qualitätsmanager', '13|*'),
(65, 'gris_publication_index', 'ISI/Web of Science', NULL),
(66, 'gris_publication_index', 'ProQuest CSA', NULL),
(67, 'gris_publication_index', 'Elsevier: Scopus', NULL),
(68, 'gris_publication_subtype', 'Nein, anderes Sammelwerk', NULL),
(69, 'gris_publication_subtype', 'Ja, full paper', NULL),
(70, 'gris_publication_subtype', 'Ja, short paper', NULL),
(71, 'gris_publication_subtype', 'Ja, workshop paper', NULL);

CREATE TABLE IF NOT EXISTS `gris_workflow` (
  `gris_workflow_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gris_workflow_name` varchar(255) NOT NULL,
  `gris_workflow_description` text,
  PRIMARY KEY (`gris_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `gris_workflow_step` (
  `gris_workflow_id` bigint(20) unsigned NOT NULL,
  `gris_workflow_step_name` varchar(255) NOT NULL,
  `gris_workflow_step_order` tinyint(6) unsigned NOT NULL,
  `gris_workflow_step_color` varchar(6) DEFAULT NULL,
  `gris_workflow_step_next` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`gris_workflow_id`,`gris_workflow_step_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `gris_workflow_step` (`gris_workflow_id`, `gris_workflow_step_name`, `gris_workflow_step_order`, `gris_workflow_step_color`, `gris_workflow_step_next`) VALUES
(1, 'Eintrag nicht überprüft (Import)', 0, 'ffff00', 2),
(1, 'Eintrag nicht überprüft (neu)', 1, 'ff0000', 2),
(1, 'Eintrag von Bibliothek überprüft', 2, '00ff00', NULL),
(1, 'Eintrag geändert', 3, 'ff00ff', 2);
