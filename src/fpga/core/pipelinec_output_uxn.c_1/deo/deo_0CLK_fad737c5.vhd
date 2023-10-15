-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 83
entity deo_0CLK_fad737c5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_fad737c5;
architecture arch of deo_0CLK_fad737c5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l527_c6_de07]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_3404]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c2_4001]
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l527_c2_4001]
signal n8_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c2_4001]
signal t8_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_4001]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l532_c11_085c]
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_72e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l532_c7_3404]
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l532_c7_3404]
signal n8_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l532_c7_3404]
signal t8_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l532_c7_3404]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l535_c11_6837]
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c7_69dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l535_c7_72e4]
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l535_c7_72e4]
signal n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l535_c7_72e4]
signal t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_72e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l539_c11_12b3]
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l539_c7_69dc]
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l539_c7_69dc]
signal n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(1 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c7_69dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l542_c11_505d]
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c1_2c5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : signed(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(31 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l542_c7_dd1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l545_c32_8c86]
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l545_c32_f336]
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l545_c32_6a3e]
signal MUX_uxn_opcodes_h_l545_c32_6a3e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l545_c32_6a3e_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l549_c42_5c05]
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l549_c23_e924]
signal device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_e924_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_e924_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_e924_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l549_c23_e924_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3c31( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.device_ram_value := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.vram_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.vram_address := ref_toks_10;
      base.is_sp_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07
BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c2_4001
device_out_result_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c2_4001
n8_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c2_4001_cond,
n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c2_4001
t8_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c2_4001_cond,
t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001
result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001
result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c
BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right,
BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l532_c7_3404
device_out_result_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond,
device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- n8_MUX_uxn_opcodes_h_l532_c7_3404
n8_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l532_c7_3404_cond,
n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- t8_MUX_uxn_opcodes_h_l532_c7_3404
t8_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l532_c7_3404_cond,
t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404
result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404
result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837
BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right,
BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4
device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- n8_MUX_uxn_opcodes_h_l535_c7_72e4
n8_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- t8_MUX_uxn_opcodes_h_l535_c7_72e4
t8_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4
result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4
result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3
BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left,
BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right,
BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc
device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- n8_MUX_uxn_opcodes_h_l539_c7_69dc
n8_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc
result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc
result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d
BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right,
BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c
device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- n8_MUX_uxn_opcodes_h_l542_c7_dd1c
n8_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c
result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c
result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86
BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left,
BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right,
BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l545_c32_f336
BIN_OP_GT_uxn_opcodes_h_l545_c32_f336 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left,
BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right,
BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output);

-- MUX_uxn_opcodes_h_l545_c32_6a3e
MUX_uxn_opcodes_h_l545_c32_6a3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l545_c32_6a3e_cond,
MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue,
MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse,
MUX_uxn_opcodes_h_l545_c32_6a3e_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left,
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right,
BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output);

-- device_out_uxn_opcodes_h_l549_c23_e924
device_out_uxn_opcodes_h_l549_c23_e924 : entity work.device_out_0CLK_45b69247 port map (
clk,
device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l549_c23_e924_device_address,
device_out_uxn_opcodes_h_l549_c23_e924_value,
device_out_uxn_opcodes_h_l549_c23_e924_phase,
device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read,
device_out_uxn_opcodes_h_l549_c23_e924_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output,
 BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output,
 MUX_uxn_opcodes_h_l545_c32_6a3e_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output,
 device_out_uxn_opcodes_h_l549_c23_e924_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_8b68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_9fba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e4d4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_34ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_69dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_9352_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_cddd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_37a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_7292_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_deeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_e02c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_5c2b_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_ffab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c31_uxn_opcodes_h_l560_l522_DUPLICATE_f023_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_34ea := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l540_c3_34ea;
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_9fba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l533_c3_9fba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_8b68 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l529_c3_8b68;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e4d4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l537_c3_e4d4;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l542_c11_505d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_left;
     BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output := BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output := result.device_ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l539_c11_12b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_69dc_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l535_c11_6837] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_left;
     BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output := BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l545_c32_8c86] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_left;
     BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output := BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l532_c11_085c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_left;
     BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output := BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output := result.is_sp_shift;

     -- BIN_OP_MINUS[uxn_opcodes_h_l549_c42_5c05] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_left;
     BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output := BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c6_de07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left := VAR_BIN_OP_AND_uxn_opcodes_h_l545_c32_8c86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c6_de07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l532_c11_085c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l535_c11_6837_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l539_c11_12b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l542_c11_505d_return_output;
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l549_c42_5c05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_4e16_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_7dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l532_l542_l539_l535_DUPLICATE_aacd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l527_l539_l532_l535_DUPLICATE_100e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_f157_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_ecf1_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_77d3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_901f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_394d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l539_l527_l532_l535_l542_DUPLICATE_b33b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l539_c7_69dc_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l545_c32_f336] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_left;
     BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output := BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- n8_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- t8_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l545_c32_f336_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_t8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     -- MUX[uxn_opcodes_h_l545_c32_6a3e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l545_c32_6a3e_cond <= VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_cond;
     MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue <= VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iftrue;
     MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse <= VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_return_output := MUX_uxn_opcodes_h_l545_c32_6a3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output := t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue := VAR_MUX_uxn_opcodes_h_l545_c32_6a3e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_t8_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     -- n8_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output := t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_n8_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l527_c2_4001_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- n8_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output := n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_n8_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- n8_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output := n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l547_c1_2c5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l547_c1_2c5d_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l527_c2_4001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- device_out[uxn_opcodes_h_l549_c23_e924] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l549_c23_e924_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l549_c23_e924_device_address <= VAR_device_out_uxn_opcodes_h_l549_c23_e924_device_address;
     device_out_uxn_opcodes_h_l549_c23_e924_value <= VAR_device_out_uxn_opcodes_h_l549_c23_e924_value;
     device_out_uxn_opcodes_h_l549_c23_e924_phase <= VAR_device_out_uxn_opcodes_h_l549_c23_e924_phase;
     device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l549_c23_e924_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output := device_out_uxn_opcodes_h_l549_c23_e924_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l555_c25_e02c] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_e02c_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l551_c31_cddd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_cddd_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l553_c26_7292] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_7292_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.is_vram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l556_c23_5c2b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_5c2b_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l557_c24_ffab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_ffab_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l550_c32_9352] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_9352_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.is_device_ram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l552_c29_37a9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_37a9_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l554_c29_deeb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_deeb_return_output := VAR_device_out_uxn_opcodes_h_l549_c23_e924_return_output.vram_write_layer;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l557_c24_ffab_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l550_c32_9352_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l553_c26_7292_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l554_c29_deeb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l556_c23_5c2b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l555_c25_e02c_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l551_c31_cddd_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l552_c29_37a9_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     -- result_vram_value_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l542_c7_dd1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l542_c7_dd1c_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l539_c7_69dc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_cond;
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output := result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l539_c7_69dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output := device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l535_c7_72e4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_cond;
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output := result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l535_c7_72e4_return_output;
     -- result_device_ram_value_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l532_c7_3404] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c2_4001_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l532_c7_3404_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c2_4001] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3c31_uxn_opcodes_h_l560_l522_DUPLICATE_f023 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c31_uxn_opcodes_h_l560_l522_DUPLICATE_f023_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3c31(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l527_c2_4001_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l527_c2_4001_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c31_uxn_opcodes_h_l560_l522_DUPLICATE_f023_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3c31_uxn_opcodes_h_l560_l522_DUPLICATE_f023_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
