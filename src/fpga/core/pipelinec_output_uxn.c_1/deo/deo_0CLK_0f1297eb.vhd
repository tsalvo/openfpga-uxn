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
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 67
entity deo_0CLK_0f1297eb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_0f1297eb;
architecture arch of deo_0CLK_0f1297eb is
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
-- BIN_OP_EQ[uxn_opcodes_h_l495_c6_ca3b]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_e3aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c2_5f5b]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l496_c3_5c02[uxn_opcodes_h_l496_c3_5c02]
signal printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_6d67]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_56a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c7_f5cd]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l503_c11_69ce]
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_54e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l503_c7_56a9]
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l503_c7_56a9]
signal n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l503_c7_56a9]
signal t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c7_56a9]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l506_c11_ff6d]
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_baca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l506_c7_54e1]
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l506_c7_54e1]
signal n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c7_54e1]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l509_c30_7912]
signal sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_ea58]
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l513_c23_b38c]
signal device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_b38c_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_55e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.u16_value := ref_toks_9;
      base.is_sp_shift := ref_toks_10;
      base.u8_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b
BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b
device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c2_5f5b
n8_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c2_5f5b
t8_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

-- printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02
printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02 : entity work.printf_uxn_opcodes_h_l496_c3_5c02_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67
BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd
device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_f5cd
n8_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c7_f5cd
t8_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd
result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd
result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd
result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce
BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9
device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- n8_MUX_uxn_opcodes_h_l503_c7_56a9
n8_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- t8_MUX_uxn_opcodes_h_l503_c7_56a9
t8_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9
result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9
result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9
result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d
BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1
device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- n8_MUX_uxn_opcodes_h_l506_c7_54e1
n8_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1
result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1
result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1
result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l509_c30_7912
sp_relative_shift_uxn_opcodes_h_l509_c30_7912 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins,
sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x,
sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y,
sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output);

-- device_out_uxn_opcodes_h_l513_c23_b38c
device_out_uxn_opcodes_h_l513_c23_b38c : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l513_c23_b38c_device_address,
device_out_uxn_opcodes_h_l513_c23_b38c_value,
device_out_uxn_opcodes_h_l513_c23_b38c_phase,
device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read,
device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read,
device_out_uxn_opcodes_h_l513_c23_b38c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output,
 device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output,
 sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output,
 device_out_uxn_opcodes_h_l513_c23_b38c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_547b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c9e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_f5cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_0f22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_461c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_0746_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_ecc0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_3d4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_8dec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_8469_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_d04a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l524_l490_DUPLICATE_9f0f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_547b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_547b;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y := resize(to_signed(-2, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c9e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_c9e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_6d67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l503_c11_69ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c6_ca3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l509_c30_7912] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_ins;
     sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_x;
     sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output := sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output := result.u16_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_ea58] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_left;
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output := BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l506_c11_ff6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output := result.vram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_f5cd_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_ca3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_6d67_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_69ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_ff6d_return_output;
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_ea58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_fcf9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_04f9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2b51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l503_l506_DUPLICATE_5a7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l500_l503_l495_DUPLICATE_0c74_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_5937_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_dae3_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_2c53_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_9536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l503_l495_l506_DUPLICATE_1da8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_7912_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- n8_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_e3aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_e3aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- printf_uxn_opcodes_h_l496_c3_5c02[uxn_opcodes_h_l496_c3_5c02] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l496_c3_5c02_uxn_opcodes_h_l496_c3_5c02_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     -- t8_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_baca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- n8_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- Submodule level 5
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_baca_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;
     -- device_out[uxn_opcodes_h_l513_c23_b38c] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l513_c23_b38c_device_address <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_device_address;
     device_out_uxn_opcodes_h_l513_c23_b38c_value <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_value;
     device_out_uxn_opcodes_h_l513_c23_b38c_phase <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_phase;
     device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_device_ram_read;
     device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_b38c_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output := device_out_uxn_opcodes_h_l513_c23_b38c_return_output;

     -- Submodule level 6
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_461c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_461c_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l521_c24_d04a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_d04a_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l518_c26_3d4f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_3d4f_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l514_c32_0f22] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_0f22_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l520_c25_8469] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_8469_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l519_c29_8dec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_8dec_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l517_c22_ecc0] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_ecc0_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.ram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l516_c21_0746] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_0746_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_b38c_return_output.u8_value;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_ecc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_d04a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_0f22_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_3d4f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_8dec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_8469_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_461c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_0746_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_54e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;

     -- Submodule level 8
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_54e1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_56a9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_56a9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c7_f5cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;

     -- Submodule level 10
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_f5cd_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_5f5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l524_l490_DUPLICATE_9f0f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l524_l490_DUPLICATE_9f0f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_55e5(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5f5b_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l524_l490_DUPLICATE_9f0f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_55e5_uxn_opcodes_h_l524_l490_DUPLICATE_9f0f_return_output;
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
