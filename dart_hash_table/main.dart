class HashNode<K, V> {
  K key;
  V value;
  HashNode<K, V>? next;

  HashNode(this.key, this.value);
}

class HashTable<K, V> {
  final int _capacity;
  final List<HashNode<K, V>?> _buckets;

  HashTable(this._capacity) : _buckets = List.filled(_capacity, null);

  // ハッシュ関数
  int _hash(K key) {
    return key.hashCode % _capacity;
  }

  // データの挿入
  void insert(K key, V value) {
    int index = _hash(key);
    HashNode<K, V>? node = _buckets[index];

    if (node == null) {
      _buckets[index] = HashNode<K, V>(key, value);
      return;
    }

    // 最後のノードまで進む
    while (node!.next != null) {
      if (node.key == key) {
        // キーが既に存在する場合は値を更新
        node.value = value;
        return;
      }
      node = node.next;
    }

    // 新しいノードを追加
    if (node.key == key) {
      node.value = value;
    } else {
      node.next = HashNode<K, V>(key, value);
    }
  }

  // キーに対応する値の取得
  V? get(K key) {
    int index = _hash(key);
    HashNode<K, V>? node = _buckets[index];

    while (node != null) {
      if (node.key == key) {
        return node.value;
      }
      node = node.next;
    }

    return null;
  }
}

void main() {
  var hashTable = HashTable<String, String>(10);
  hashTable.insert("key1", "value1");
  hashTable.insert("key2", "value2");
  hashTable.insert("key3", "value3");

  print('key1: ${hashTable.get("key1")}');
  print('key2: ${hashTable.get("key2")}');
  print('key3: ${hashTable.get("key3")}');
}
