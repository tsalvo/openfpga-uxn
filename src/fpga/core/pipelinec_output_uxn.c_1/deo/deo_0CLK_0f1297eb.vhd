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
-- BIN_OP_EQ[uxn_opcodes_h_l495_c6_2dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_4b40]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_55cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c2_5c0a]
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l496_c3_7a81[uxn_opcodes_h_l496_c3_7a81]
signal printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_b9a4]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_f65d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c7_55cd]
signal t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c7_55cd]
signal n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_55cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(3 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_55cd]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l503_c11_3a29]
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_96dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l503_c7_f65d]
signal t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l503_c7_f65d]
signal n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_f65d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l503_c7_f65d]
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l506_c11_536a]
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_52d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l506_c7_96dc]
signal n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_96dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l506_c7_96dc]
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l509_c30_5dcb]
signal sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_2360]
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l513_c23_9fc5]
signal device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_9fc5_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3b39( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.vram_write_layer := ref_toks_8;
      base.is_sp_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.stack_address_sp_offset := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe
BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c2_5c0a
t8_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c2_5c0a
n8_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a
device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

-- printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81
printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81 : entity work.printf_uxn_opcodes_h_l496_c3_7a81_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4
BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c7_55cd
t8_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_55cd
n8_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd
result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd
result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd
result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd
device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29
BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- t8_MUX_uxn_opcodes_h_l503_c7_f65d
t8_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- n8_MUX_uxn_opcodes_h_l503_c7_f65d
n8_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d
result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d
result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d
result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d
device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond,
device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a
BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output);

-- n8_MUX_uxn_opcodes_h_l506_c7_96dc
n8_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc
result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc
result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc
result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc
device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond,
device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue,
device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse,
device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb
sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins,
sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x,
sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y,
sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output);

-- device_out_uxn_opcodes_h_l513_c23_9fc5
device_out_uxn_opcodes_h_l513_c23_9fc5 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l513_c23_9fc5_device_address,
device_out_uxn_opcodes_h_l513_c23_9fc5_value,
device_out_uxn_opcodes_h_l513_c23_9fc5_phase,
device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read,
device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read,
device_out_uxn_opcodes_h_l513_c23_9fc5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output,
 n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output,
 device_out_uxn_opcodes_h_l513_c23_9fc5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_ff30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_d6e9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_55cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_99d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_d412_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_8c35_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_e23f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_c7af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_3942_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_ff61_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_c06a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l490_l524_DUPLICATE_ae39_return_output : opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y := resize(to_signed(-2, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_ff30 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_ff30;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_d6e9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_d6e9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l509_c30_5dcb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_ins;
     sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_x;
     sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output := sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l503_c11_3a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l506_c11_536a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_left;
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output := BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_55cd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_2360] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_left;
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output := BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c6_2dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_b9a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_2dbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_b9a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_3a29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_536a_return_output;
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_2360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_eab4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_c59b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_061c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l500_l506_DUPLICATE_ad82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l500_l495_DUPLICATE_9ef2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_f3fb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_d57d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_7c2f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_cc3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l500_l506_l495_DUPLICATE_4f90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_5dcb_return_output;
     -- n8_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_4b40] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_4b40_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     -- printf_uxn_opcodes_h_l496_c3_7a81[uxn_opcodes_h_l496_c3_7a81] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l496_c3_7a81_uxn_opcodes_h_l496_c3_7a81_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- n8_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_52d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output;

     -- n8_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- Submodule level 5
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_52d6_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;
     -- device_out[uxn_opcodes_h_l513_c23_9fc5] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l513_c23_9fc5_device_address <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_device_address;
     device_out_uxn_opcodes_h_l513_c23_9fc5_value <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_value;
     device_out_uxn_opcodes_h_l513_c23_9fc5_phase <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_phase;
     device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_device_ram_read;
     device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output := device_out_uxn_opcodes_h_l513_c23_9fc5_return_output;

     -- Submodule level 6
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l521_c24_c06a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_c06a_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l514_c32_99d5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_99d5_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l518_c26_c7af] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_c7af_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l516_c21_8c35] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_8c35_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_d412] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_d412_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l517_c22_e23f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_e23f_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l520_c25_ff61] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_ff61_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l519_c29_3942] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_3942_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_9fc5_return_output.vram_write_layer;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_e23f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_c06a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_99d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_c7af_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_3942_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_ff61_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_d412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_8c35_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_96dc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;

     -- Submodule level 8
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_96dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_f65d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_f65d_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_55cd] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;

     -- Submodule level 10
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_55cd_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c2_5c0a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l490_l524_DUPLICATE_ae39 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l490_l524_DUPLICATE_ae39_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3b39(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_5c0a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l490_l524_DUPLICATE_ae39_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3b39_uxn_opcodes_h_l490_l524_DUPLICATE_ae39_return_output;
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
