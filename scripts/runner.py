import json
import os
from typing import Dict, Any

class ProtocolRunner:
    """Loads and validates protocol definitions."""

    def __init__(self, filepath: str):
        self.filepath = filepath
        self.protocol_data: Dict[str, Any] = {}

    def load_protocol(self) -> Dict[str, Any]:
        """Reads protocol configuration from a JSON file."""
        if not os.path.exists(self.filepath):
            raise FileNotFoundError(f"Protocol file not found at {self.filepath}")

        with open(self.filepath, "r", encoding="utf-8") as f:
            self.protocol_data = json.load(f)
        return self.protocol_data

    def validate_variables(self, provided_vars: Dict[str, Any]) -> bool:
        """Verifies all required variables defined in the protocol are present."""
        required_vars = self.protocol_data.get("variables", [])
        missing = [var for var in required_vars if var not in provided_vars]

        if missing:
            print(f"[Error] Missing required variables: {', '.join(missing)}")
            return False
        
        print("[Success] All required protocol variables are present.")
        return True

if __name__ == "__main__":
    template_path = os.path.join("templates", "base_protocol.json")
    
    runner = ProtocolRunner(template_path)
    protocol = runner.load_protocol()
    
    print(f"Loaded Protocol: {protocol.get('title')} (v{protocol.get('version')})")
    
    # Sample execution check
    test_inputs = {"input_text": "Sample execution", "mode": "strict"}
    runner.validate_variables(test_inputs)
